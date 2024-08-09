/*
  SPDX-License-Identifier: Apache-2.0
*/

import { Object, Property } from "fabric-contract-api";

@Object()
export class LeaveRequest {
    @Property()
    public docType?: string;

    @Property()
    public ID: string;

    @Property()
    public Requestor: string;

    @Property()
    public LeaveType: string;

    @Property()
    public LeaveDay: string;

    @Property()
    public LeaveDuration: number;

    @Property()
    public LeaveStartDate: string;

    @Property()
    public LeaveEndDate: string;
    @Property()
    public LeaveReason?: string;

    @Property()
    public RdRequest?: string;

    @Property()
    public Approver?: string;

    @Property()
    public Rejector?: string;

    @Property()
    public RejectedReason?: string;
}

export interface LeaveRequestInterface {
    docType?: string;
    _id: string;
    requestor: string;
    leaveType: string;
    leaveDay: string;
    leaveDuration: number;
    leaveStartDate: string;
    leaveEndDate: string;
    leaveReason: string;
    rdRequest?: string;
    approver?: string;
}
