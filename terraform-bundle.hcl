terraform {
  # Version of Terraform to include in the bundle. An exact version number
  # is required.
  version = "0.11.8"
}

# Define which provider plugins are to be included
providers {
  # Include a custom plugin to the bundle. Will search for the plugin in the
  # plugins directory, and package it with the bundle archive. Plugin must have
  # a name of the form: terraform-provider-*, and must be build with the operating
  # system and architecture that terraform enterprise is running, e.g. linux and amd64
  layer0 = ["0.11.0"]
}
