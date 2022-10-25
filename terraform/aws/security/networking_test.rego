package terraform.aws.security.networking

test_allowed_vpc_cidrs {
	deny_vpc_cidrs == set() with input as data.allowed_vpc_input
}

test_denied_vpc_cidrs {
	count(deny_vpc_cidrs) == 1 with input as data.denied_vpc_input
}
