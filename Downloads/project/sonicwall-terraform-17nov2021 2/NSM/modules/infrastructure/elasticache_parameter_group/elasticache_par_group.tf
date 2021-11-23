resource "aws_elasticache_parameter_group" "elasicache_par_group" {
  name        = "${var.ele_cache_par_gr_name}"
  family      = "${var.ele_cache_par_gr_family}"
  description = "${var.ele_cache_par_gr_description}"
}
