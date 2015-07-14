## PiChef
Chef on Raspberry Pi.

### Introduction

PiChef brings the joy of configuration management system [Chef](https://www.chef.io/chef/)
on [Raspberry Pi](https://www.raspberrypi.org/).
PiChef is conceived with following goals
  - Ease building and maintaining raspberry pi related projects (like weather stations, CNC machines, home automation).
  by providing chef installers for Raspberry Pi, generic server administration cookbooks (sudo, ssh).
  - Setting up a continuous integration chain with upstream Chef projects and essential chef cookbooks using [GoatOS](https://github.com/goatos)
  - As a learning platform for system automation (run a small data center backed by chef).

Currently PiChef provides following:
- Chef omnibus packages for Raspberry Pi, available from [GotOS raspi](https://packagecloud.io/goatos/raspi) packagecloud repository.
- Cookbook to run [Goiardi](https://github.com/ctdk/goiardi), an opensource chef server written in [go](https://golang.org/).
- Roles to configure omnibus build servers


### Description

- If you are new to Chef or configuration management system read a little about Chef. Following
are great resources.
  - [learn chef](https://learn.chef.io/) website
- Settin up your workstation
  - This guide assumes all your Raspberry Pi are accessible via
ssh. `Workstation` is assumed to be a separate machine (can be your laptop)
from where Pi will be managed.
    - Install ruby and bundler.
    - Clone this repository
    - Install all gem dependencies
      ```sh
      bundle install --path .bundle
      ```
    - Install chef on a RaspberryPi
      ```sh
      bundle exec knife blend blends/install.rb -h <IPADDRESS> --prompt
      ```

- Basic topology
  - chef server
  - build agents
  - the weather station
  - mechanical radiators
    - LED Segments
    - Steppers


## Contributing/Development

The general development process is:

1. Fork this repo and clone it to your workstation
2. Create a feature branch for your change
3. Write code and tests
4. Push your feature branch to github and open a pull request against
   master

Once your repository is set up, you can start working on the code. We do use
TDD with RSpec, so you'll need to get a development environment running.
Follow the above procedure ("Installing from Git") to get your local
copy of the source running.


### LICENSE

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
