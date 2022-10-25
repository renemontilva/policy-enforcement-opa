package terraform.aws.security.networking

import input.plan as tfplan

# Checks vpc cidrs
deny_vpc_cidrs[msg] {
	resource_changes := tfplan.resource_changes[_]
	resource_changes.type == "aws_vpc"
	resource_changes.change.after.cidr_block == "10.60.0.0/16"
	msg := sprintf("security rule: cidrs:%v is not allowed", [resource_changes.change.after.cidr_block])
}
