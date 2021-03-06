name 'base'

default_attributes(
  'authorization' => {
    'sudo' => {
      'groups' => %w(),
      'include_sudoers_d' => true
    }
  }
)

run_list %w(
  recipe[raspi::base]
  recipe[raspi::chef]
  recipe[raspi::serf]
  recipe[raspi::statsd]
)
