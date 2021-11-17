1. [About This Project](#about-this-project)
2. [Getting Started](#getting-started)
3. [Inserting new automated tests](#inserting-new-automated-tests)
4. [Important links](#important-links)
5. [Challenges](#challenges)


# About This Project

This repository is intended for people who want to start a GUI test automation,by using Ruby + Capybara + Cucumber tech stack.

The intention is to help beginners to practice test automation, without worrying about the initial setup of the environment, getting straight to the point!

This project uses the website [The Internet](http://the-internet.herokuapp.com/), where you can improve your automation skills through various web elements available for handler.


# Getting Started

To get started, you need to:

1. Fork this repository
2. Have the docker installed on your machine, [go to this link](https://docs.docker.com/get-docker/)
3. Go to the terminal, and execute the following command:

```shell
docker pull aludmila/ruby-ui-test:latest
```

4. Still in the terminal, execute the following command:

```shell
docker compose up ruby-ui-test
```


🥳 Then your environment will be ready to go!

5. Every time you want to run your tests, run the command:

```shell
docker compose up ruby-ui-test
```

# Inserting new automated tests

* Insert a new `.feature` file in the `features/specifications/` directory. [Example](#feature-example)
* run your tests, by using the command: `docker compose up ruby-ui-test`

# Important links

* [Capybara Team](https://github.com/teamcapybara/capybara)
* [Manipulação de elementos GUI](https://github.com/teamcapybara/capybara#the-dsl)


# Challenges

1. Implement an automated test that validates the functionality of [**Dropdown List**](http://the-internet.herokuapp.com/dropdown)
2. Implement an automated test that validates the functionality of [**Inputs**](http://the-internet.herokuapp.com/inputs)
3. Implement an automated test that validates the functionality of [**Checkboxes**](http://the-internet.herokuapp.com/checkboxes)
4. Implement an automated test that validates the functionality of [**Basic Auth**](http://the-internet.herokuapp.com/basic_auth)
5. Implement an automated test that validates the functionality of [**Hovers**](http://the-internet.herokuapp.com/hovers)



# Feature Example

```yml

# language: pt

Funcionalidade: Checkbox

  Contexto: Home
    Dado que eu esteja na home do Internet

  Cenário: Testar um checkbox clicando na opcao 1
    Quando entro na pagina de checkbox e escolho a "Option 1"

```
