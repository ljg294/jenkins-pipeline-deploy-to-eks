module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "webconnect-eks-cluster"
    cluster_version = "1.27"

    cluster_endpoint_public_access  = true

    vpc_id = module.webconnect-vpc.vpc_id
    subnet_ids = module.webconnect-vpc.private_subnets

    tags = {
        environment = "development"
        application = "webconnect"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 2

            instance_types = ["t2.micro"]
        }
    }
}