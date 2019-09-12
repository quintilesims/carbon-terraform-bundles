# carbon-terraform-bundles
Hosting location for custom TFE bundles

# Creating a new bundle

For the most part, you should just follow the instructions outlined in the [`terraform-bundle` tool's](https://github.com/hashicorp/terraform/tree/v0.11.8/tools/terraform-bundle) README.

A few things to note:

- You will need a local copy of the official Terraform repository, and you will need to checkout to the specific tag of Terraform for which you intend to build the bundle.
  Also make sure that you pin this same version of Terraform within `terraform-bundle.hcl`.
  - **Example:** Let's say you wanted to create a TFE bundle that included the v0.11.0 Layer0 provider.
  Layer0 v0.11.0 requires Terraform v0.11.8, so you would need to make sure that your local Terraform clone is checked out to v0.11.8 before you go to build the `terraform-bundle` tool.

- Any custom plugins you want to bundle must be included in this repo, in the `plugins/` directory, and with this filename convention: `terraform-provider-PROVIDERNAME_vSEMVER`.
  Make sure to substitute `PROVIDERNAME` and `SEMVER` appropriately.
  - :white_check_mark: `terraform-provider-layer0_v0.11.0`

- The provider name when specified in `terraform-bundle.hcl` is _just the name_ - it should not mirror the filename.
  - :x: ~~`terraform-provider-layer0: ["0.11.0"]`~~
  - :white_check_mark: `layer0: ["0.11.0"]`

- TFE bundles should be built for Linux on AMD64, so you'll need to specify that when you build the bundle:

```bash
terraform-bundle package -os=linux -arch=amd64 terraform-bundle.hcl
```

Once you've created a new bundle, move it into the `bundles/` directory and document the specs of the bundle in the [Bundles](#bundles) section of this README.

# Bundles

[0.11.8-bundle2019091222](bundles/terraform_0.11.8-bundle2019091222_linux_amd64.zip)
- Terraform v0.11.8
- Layer0 v0.11.0
