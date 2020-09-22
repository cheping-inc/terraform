/*
resource "aws_iam_user" "appli_users" {
  count = length(var.my_users)

  name = var.my_users[count.index].name
}
*/



resource "aws_iam_user" "appli_users" {
  for_each = var.my_users
  name     = "${each.value.name}-${local.env}"
}
