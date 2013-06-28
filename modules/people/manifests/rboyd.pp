class people::rboyd {
  include spotify
  include iterm2::stable
  include slate
  include chrome
  include zsh
  include emacs
  include onepassword
  include tmux
  include dropbox
  include alfred
  include vagrant
  include virtualbox

  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  repository { $dotfiles_dir:
    source => "http://github.com/rboyd/dotfiles"
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${dotfiles_dir}/.zshrc",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.tmux.conf":
    ensure  => link,
    target  => "${dotfiles_dir}/.tmux.conf",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.slate":
    ensure  => link,
    target  => "${dotfiles_dir}/.slate",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.emacs":
    ensure  => link,
    target  => "${dotfiles_dir}/.emacs",
    require => Repository[$dotfiles_dir]
  }
  
  file { "${home}/.emacs.d":
    ensure  => link,
    target  => "${dotfiles_dir}/.emacs.d",
    require => Repository[$dotfiles_dir]
  }
}
