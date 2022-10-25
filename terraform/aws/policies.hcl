policy "cost_instances" {
    query = "data.terraform.aws.cost.instances.deny"
    enforcement_level = "mandatory"
}

policy "security_vpc_cidrs" {
    query = "data.terraform.aws.security.networking.deny_vpc_cidrs"
    enforcement_level = "mandatory"
}
