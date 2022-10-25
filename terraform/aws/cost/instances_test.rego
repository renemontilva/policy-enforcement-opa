package terraform.aws.cost.instances

test_allowed_instances {
	deny == set() with input as data.allowed_input
}

test_denied_instances {
	count(deny) == 2 with input as data.denied_input
}
