
<!-- markdownlint-disable -->
# terraform-aws-account-baseline
<!-- markdownlint-restore -->

<!-- [![README Header][readme_header_img]][readme_header_link] -->

[![The Guardian][logo]][website]

<!--




  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **





-->

Terraform module for bringing an AWS Control Tower workload/application account into governance.

---






It's 100% Open Source and licensed under the [GNU General Public License](LICENSE).









## Introduction


This module should be used on your standard workload and application accounts.

The terraform-aws-account-baseline module enforces security and management best practices across AWS accounts. It provides standardized configurations for:

    * Account security baselines
    * Account management settings
    * Compliance requirements

This module helps maintain consistent security controls and configurations when managing multiple AWS accounts through Terraform.

### Features

#### Submodule: Account

**Usage**: Apply once to an account.

  * AWS IAM Account Alias: Creates a custom account alias for simplified AWS account identification
  * AWS IAM Account Password Policy: Sets strong password requirements for IAM users
  * AWS S3 Account Public Access Block: Prevents public access to S3 buckets at the account level
  * AWS IAM OpenID Connect Provider: Enables identity federation through OpenID Connect
      * GitHub
      * GitLab
      * Keycloak


#### Submodule: Regional

**Usage**: Apply to each region in an account.

* EBS Encryption by Default: Ensures all new EBS volumes are automatically encrypted
* Block public EBS snapshot sharing: Prevents EBS snapshots from being shared publicly
* Terraform State Resources:
    * Terraform State Bucket: Stores Terraform state files securely
    * Terraform DynamoDB State Lock Table: Prevents concurrent state modifications



## Usage




```terraform
module "account" {
  source = "git::https://gitlab.com/guardianproject-ops/terraform-aws-account-baseline//modules/account?ref=main"
}

module "region_main" {
  source = "git::https://gitlab.com/guardianproject-ops/terraform-aws-account-baseline//modules/region?ref=main"
  providers = {
  aws =  aws
  }
}

module "region_other" {
  source = "git::https://gitlab.com/guardianproject-ops/terraform-aws-account-baseline//modules/region?ref=main"
  providers = {
    aws =  aws.other
  }
}
```

## Documentation

Docs are nice!






<!-- markdownlint-disable -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- markdownlint-restore -->




## Help

**Got a question?** We got answers.

File a GitLab [issue](https://gitlab.com/guardianproject-ops/terraform-aws-account-baseline/-/issues), send us an [email][email] or join our [Matrix Community][matrix].

## Matrix Community

[![Matrix badge](https://img.shields.io/badge/Matrix-%23guardianproject%3Amatrix.org-blueviolet)][matrix]

Join our [Open Source Community][matrix] on Matrix. It's **FREE** for everyone!
This is the best place to talk shop, ask questions, solicit feedback, and work
together as a community to build on our open source code.

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://gitlab.com/guardianproject-ops/terraform-aws-account-baseline/-/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or help out with our other projects, we would love to hear from you! Shoot us an [email][email].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitLab
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2021-2025 The Guardian Project










## License

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

```text
GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```






## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained by [The Guardian Project][website].

[![The Guardian Project][logo]][website]

We're a [collective of designers, developers, and ops][website] folk focused on useable
privacy and security with a focus on digital human rights and humanitarian projects.

Everything we do is 100% FOSS.

Follow us on [Mastodon][mastodon] or [twitter][twitter], [apply for a job][join], or
[partner with us][partner].

We offer [paid support][contact] on all of our projects.

Check out [our other DevOps projects][gitlab] or our [entire other set of
projects][nonops] related to privacy and security related software, or [hire
us][website] to get support with using our projects.


## Contributors

<!-- markdownlint-disable -->
|  [![Abel Luck][abelxluck_avatar]][abelxluck_homepage]<br/>[Abel Luck][abelxluck_homepage] |
|---|
<!-- markdownlint-restore -->

  [abelxluck_homepage]: https://gitlab.com/abelxluck

  [abelxluck_avatar]: https://secure.gravatar.com/avatar/0f605397e0ead93a68e1be26dc26481a?s=200&amp;d=identicon


<!-- markdownlint-disable -->
  [website]: https://guardianproject.info/?utm_source=gitlab&utm_medium=readme&utm_campaign=guardianproject-ops/terraform-aws-account-baseline&utm_content=website
  [gitlab]: https://www.gitlab.com/guardianproject-ops
  [contact]: https://guardianproject.info/contact/
  [matrix]: https://matrix.to/#/%23guardianproject:matrix.org
  [readme_header_img]: https://gitlab.com/guardianproject/guardianprojectpublic/-/raw/master/Graphics/GuardianProject/pngs/logo-color-w256.png
  [readme_header_link]: https://guardianproject.info?utm_source=gitlab&utm_medium=readme&utm_campaign=guardianproject-ops/terraform-aws-account-baseline&utm_content=readme_header_link
  [readme_commercial_support_img]: https://www.sr2.uk/readme/paid-support.png
  [readme_commercial_support_link]: https://www.sr2.uk/?utm_source=gitlab&utm_medium=readme&utm_campaign=guardianproject-ops/terraform-aws-account-baseline&utm_content=readme_commercial_support_link
  [partner]: https://guardianproject.info/how-you-can-work-with-us/
  [nonops]: https://gitlab.com/guardianproject
  [mastodon]: https://social.librem.one/@guardianproject
  [twitter]: https://twitter.com/guardianproject
  [email]: mailto:support@guardianproject.info
  [join_email]: mailto:jobs@guardianproject.info
  [join]: https://guardianproject.info/contact/join/
  [logo_square]: https://assets.gitlab-static.net/uploads/-/system/group/avatar/3262938/guardianproject.png?width=88
  [logo]: https://gitlab.com/guardianproject/guardianprojectpublic/-/raw/master/Graphics/GuardianProject/pngs/logo-color-w256.png
  [logo_black]: https://gitlab.com/guardianproject/guardianprojectpublic/-/raw/master/Graphics/GuardianProject/pngs/logo-black-w256.png
  [cdr]: https://digiresilience.org
  [cdr-tech]: https://digiresilience.org/tech/
<!-- markdownlint-restore -->
