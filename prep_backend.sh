#!/bin/bash -e

init() {
  [ -z $ACCOUNT ] && ACCOUNT="$(basename `pwd`)" || ACCOUNT=$ACCOUNT

  cat << EOS
terraform {
  required_version = "0.12.5"
  backend "s3" {
    bucket = "${BUCKET}"
    key    = "datadog/${ACCOUNT}/${STAGE}/terraform.tfstate"
    region = "us-east-1"
  }
}
EOS

}

while getopts "b:s:a:" opt; do
  case "$opt" in
    a)
      ACCOUNT=$OPTARG
      ;;
    b)
      BUCKET=$OPTARG
      ;;
    s)
      STAGE=$OPTARG
      ;;
  esac
done

shift $((OPTIND-1))

init
