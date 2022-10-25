package terraform.aws.cost.instances

import input.plan as tfplan

actions := ["create", "delete"]

instances_type := [
	"112xlarge",
	"56xlarge",
	"24xlarge",
	"32xlarge",
	"18xlarge",
	"16xlarge",
]

# Check Instances type
deny[msg] {
	resource_changes := tfplan.resource_changes[_]
	endswith(resource_changes.change.after.instance_type, instances_type[_])
	some i, j
	resource_changes.change.actions[i] == actions[j]
	msg := sprintf("Cost rule: resource: %v, instance type: %v, not allowed action: %v", [resource_changes.name, resource_changes.change.after.instance_type, actions[j]])
}
