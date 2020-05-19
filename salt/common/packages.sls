common-packages:
  pkg.installed:
    - names:
      - wget
      - git
      - python3
      - python3-pip

add-bash-aliases:
  cmd.run:
    - names:
      - echo "alias pip=pip3" > ~/.bash_aliases
      - . ~/.bash_aliases
    - require:
      - pkg: common-packages