/*
 * SPDX-License-Identifier: Apache-2.0
 */
// Deterministic JSON.stringify()
import { Context, Contract, Info, Returns, Transaction } from "fabric-contract-api";
import stringify from "json-stringify-deterministic";
import sortKeysRecursive from "sort-keys-recursive";
import { LeaveRequest } from "./leaveRequest";

@Info({ title: "LeaveRequestTransfer", description: "Smart contract for trading leaveRequest" })
export class LeaveRequestContract extends Contract {
    @Transaction()
    public async InitLedger(ctx: Context): Promise<void> {
        const leaveRequests: LeaveRequest[] = [
            {
                ID: "a123456789123352462346",
                Requestor: "a12335436234623462",
                LeaveType: "replacementLeave",
                LeaveDay: "day",
                LeaveDuration: 1,
                LeaveStartDate: "2023-11-05T15:00:00.000+00:00",
                LeaveEndDate: "2023-11-05T15:00:00.000+00:00",
                LeaveReason: "받은 대체 휴가를 사용하겠습니다.",
                RdRequest: "65430472996ac9045fb02bf8",
                Approver: "65419a0d64182214d18a36e4",
                Rejector: "",
                RejectedReason: "",
            },
        ];

        for (const leaveRequest of leaveRequests) {
            leaveRequest.docType = "leaveRequest";
            // example of how to write to world state deterministically
            // use convetion of alphabetic order
            // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
            // when retrieving data, in any lang, the order of data will be the same and consequently also the corresonding hash
            await ctx.stub.putState(leaveRequest.ID, Buffer.from(stringify(sortKeysRecursive(leaveRequest))));
            console.info(`Asset ${leaveRequest.ID} initialized`);
        }
    }

    // CreateAsset issues a new asset to the world state with given details.
    @Transaction()
    public async CreateLeaveRequest(
        ctx: Context,
        _id: string,
        requestor: string,
        leaveType: string,
        leaveDay: string,
        leaveDuration: number,
        leaveStartDate: string,
        leaveEndDate: string,
        leaveReason: string
    ): Promise<void> {
        const exists = await this.LeaveRequestExists(ctx, _id);
        if (exists) {
            throw new Error(`The leaveRequest ${_id} already exists`);
        }

        const leaveRequest = {
            ID: _id,
            Requestor: requestor,
            LeaveType: leaveType,
            LeaveDay: leaveDay,
            LeaveDuration: leaveDuration,
            LeaveStartDate: leaveStartDate,
            LeaveEndDate: leaveEndDate,
            LeaveReason: leaveReason,
            RdRequest: "",
            Approver: "",
            Rejector: "",
            RejectedReason: "",
        };
        // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
        await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(leaveRequest))));
    }

    // CreateAsset issues a new asset to the world state with given details.
    @Transaction()
    public async CreateRdLeaveRequest(
        ctx: Context,
        _id: string,
        requestor: string,
        leaveType: string,
        leaveDay: string,
        leaveDuration: number,
        leaveStartDate: string,
        leaveEndDate: string,
        status: string,
        createdAt: string,
        updatedAt: string,
        leaveReason: string,
        rdRequest: string
    ): Promise<void> {
        const exists = await this.LeaveRequestExists(ctx, _id);
        if (exists) {
            throw new Error(`The leaveRequest ${_id} already exists`);
        }

        const leaveRequest = {
            ID: _id,
            Requestor: requestor,
            LeaveType: leaveType,
            LeaveDay: leaveDay,
            LeaveDuration: leaveDuration,
            LeaveStartDate: leaveStartDate,
            LeaveEndDate: leaveEndDate,
            Status: status,
            CreatedAt: createdAt,
            UpdatedAt: updatedAt,
            LeaveReason: leaveReason,
            RdRequest: rdRequest,
            Approver: "",
            Rejector: "",
            RejectedReason: "",
        };
        // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
        await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(leaveRequest))));
    }

    // Readl\LeaveRequest returns the leaveRequest stored in the world state with given id.
    @Transaction(false)
    public async ReadLeaveRequest(ctx: Context, _id: string): Promise<string> {
        const leaveRequestJSON = await ctx.stub.getState(_id); // get the leaveRequest from chaincode state
        if (!leaveRequestJSON || leaveRequestJSON.length === 0) {
            throw new Error(`The leaveRequest ${_id} does not exist`);
        }
        return leaveRequestJSON.toString();
    }

    // UpdateLeaveRequest updates an existing leaveRequest in the world state with provided parameters.
    @Transaction()
    public async UpdateLeaveRequest(
        ctx: Context,
        _id: string,
        requestor: string,
        leaveType: string,
        leaveDay: string,
        leaveDuration: number,
        leaveStartDate: string,
        leaveEndDate: string,
        status: string,
        createdAt: string,
        updatedAt: string,
        leaveReason?: string,
        rdRequest?: string,
        approver?: string,
        rejector?: string,
        rejectedReason?: string
    ): Promise<void> {
        const exists = await this.LeaveRequestExists(ctx, _id);
        if (!exists) {
            throw new Error(`The leaveRequest ${_id} does not exist`);
        }

        // overwriting original leaveRequest with new leaveRequest
        const updatedLeaveRequest = {
            ID: _id,
            Requestor: requestor,
            LeaveType: leaveType,
            LeaveDay: leaveDay,
            LeaveDuration: leaveDuration,
            LeaveStartDate: leaveStartDate,
            LeaveEndDate: leaveEndDate,
            Status: status,
            CreatedAt: createdAt,
            UpdatedAt: updatedAt,
            LeaveReason: leaveReason || "",
            RdRequest: rdRequest || "",
            Approver: approver || "",
            Rejector: rejector || "",
            RejectedReason: rejectedReason || "",
        };
        // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
        return ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(updatedLeaveRequest))));
    }

    // DeleteLeaveRequest deletes an given LeaveRequest from the world state.
    @Transaction()
    public async DeleteLeaveRequest(ctx: Context, _id: string): Promise<void> {
        const exists = await this.LeaveRequestExists(ctx, _id);
        if (!exists) {
            throw new Error(`The LeaveRequest ${_id} does not exist`);
        }
        return ctx.stub.deleteState(_id);
    }

    // LeaveRequestExists returns true when ㅣeaveRequest with given ID exists in world state.
    @Transaction(false)
    @Returns("boolean")
    public async LeaveRequestExists(ctx: Context, _id: string): Promise<boolean> {
        const leaveRequestJSON = await ctx.stub.getState(_id);
        return leaveRequestJSON && leaveRequestJSON.length > 0;
    }

    // TransferLeaveRequest updates the owner field of leaveRequest with given id in the world state, and returns the old owner.
    @Transaction()
    public async CancelLeaveRequest(ctx: Context, _id: string, status: string, updatedAt: string): Promise<string> {
        const leaveRequestString = await this.ReadLeaveRequest(ctx, _id);
        const leaveRequest = JSON.parse(leaveRequestString);
        leaveRequest.Status = status;
        leaveRequest.UpdatedAt = updatedAt;
        // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
        await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(leaveRequest))));
        return leaveRequest;
    }

    // TransferLeaveRequest updates the owner field of leaveRequest with given id in the world state, and returns the old owner.
    @Transaction()
    public async ApproveLeaveRequest(ctx: Context, _id: string, approver: string, status: string, updatedAt: String): Promise<string> {
        const leaveRequestString = await this.ReadLeaveRequest(ctx, _id);
        const leaveRequest = JSON.parse(leaveRequestString);
        leaveRequest.Approver = approver;
        leaveRequest.Status = status;
        leaveRequest.UpdateAt = updatedAt;
        // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
        await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(leaveRequest))));
        return leaveRequest;
    }

    // TransferLeaveRequest updates the owner field of leaveRequest with given id in the world state, and returns the old owner.
    @Transaction()
    public async RejectLeaveRequest(
        ctx: Context,
        _id: string,
        rejector: string,
        status: string,
        rejectedReason: string,
        updatedAt: String
    ): Promise<string> {
        const leaveRequestString = await this.ReadLeaveRequest(ctx, _id);
        const leaveRequest = JSON.parse(leaveRequestString);
        leaveRequest.Rejector = rejector;
        leaveRequest.RejectedReason = rejectedReason;
        leaveRequest.Status = status;
        leaveRequest.UpdateAt = updatedAt;
        // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
        await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(leaveRequest))));
        return leaveRequest;
    }

    // GetAllLeaveRequest returns all leaveRequest found in the world state.
    @Transaction(false)
    @Returns("string")
    public async GetAllLeaveRequests(ctx: Context): Promise<string> {
        const allResults = [];
        // range query with empty string for startKey and endKey does an open-ended query of all leaveRequests in the chaincode namespace.
        const iterator = await ctx.stub.getStateByRange("", "");
        let result = await iterator.next();
        while (!result.done) {
            const strValue = Buffer.from(result.value.value.toString()).toString("utf8");
            let record;
            try {
                record = JSON.parse(strValue);
            } catch (err) {
                console.log(err);
                record = strValue;
            }
            allResults.push(record);
            result = await iterator.next();
        }
        return JSON.stringify(allResults);
    }
}
