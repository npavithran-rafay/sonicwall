output "id" {
  value = [aws_glue_crawler.analyzer-ng.id,aws_glue_crawler.analyzer-ng-url.id,aws_glue_crawler.analyzer-ng-appsdata.id,aws_glue_crawler.analyzer-ng-coredata.id,aws_glue_crawler.analyzer-ng-ifacedata.id,aws_glue_crawler.analyzer-ng-memdata.id]
}

output "arn" {
  value = [aws_glue_crawler.analyzer-ng.arn,aws_glue_crawler.analyzer-ng-url.arn,aws_glue_crawler.analyzer-ng-appsdata.arn,aws_glue_crawler.analyzer-ng-coredata.arn,aws_glue_crawler.analyzer-ng-ifacedata.arn,aws_glue_crawler.analyzer-ng-memdata.arn]
}

