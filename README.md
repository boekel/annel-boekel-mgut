# MATLAB HS13 – Research Plan

* Group Name: The Opinion Formers
* Group participants names: Lukas Boeke, Melanie Gut, Anne-Michelle Luescher
* Project Title: Opinion Formation

## General Introduction

While reading the papers indicated below, we found out that various approaches can be used to model opinion formation and the dynamical development of changes in opinion. We focused on the article [1], where opinion convergenve of interaction between individuals is simulated. The model used is very simple and straightforward, only containing one main formula; however, it seems to depict opinion convergence accuratly in a qualitative way. In [3] a rather complex approach is chosen, using a more mathematical than "common sense" formulation. However, the article does not focus specifically on opinion formation but rather on behavioural changes based on social interactions. The goal of this project will be to expand the first model by adding elements similar to [3] to make it more realistic.

## The Model

We want to attempt to combine two approaches by adding one (or several) variables to the equation used in [1], which shall take into account the "charisma" of the agents (the exact name of that variable and its implementation will be revealed during the work process). We think that while the model in [1] works well in its simplicity it would become more realistic if we considered the logical fact that not every individual has the same amount of influence on peers. Thus, one agent may possibly have a greater impact on the interacting agent´s opinion than the other way round. We will try to make realistic assumptions as to which individuals (the extreme ones or the less extreme ones) have a greater ability of influencing peers.

## Fundamental Questions

The important questions are:

* How can we express different opinions? Can we measure the "distance" between opinions?
* How can we implement the effect of stubbornness and convincibility ("charisma")?
* How should these factors be weighted and included in the model? (Can we use physics, as in [3]?)

## Expected Results

What we want to know in the end are the answers to the following questions:

* How do our additional assumptions about opinion formation influence the result of the conducted simulations mentioned in [1]?
* Does the convincibility factor influence the outcome of the simulation significantly and if so, to what extent? Can it be ignored or not?

We expect a change in the patterns of the clusters, as we assume that social factors play a significant role in opinion formation and convergence.
## References 

[1] Laguna, Abramson, Zanette: Minorities in a Model for Opinion Formation; 
2004 Wiley Periodicals, Inc.; Vol. 9, No.4

[2] Holme, Newman: Nonequilibrium phase transition in the coevolution of networks and opinions
arXiv:physics/0603023v3

[3] Helbing: A Mathematical Model for the Behavior of Individuals in a Social Field
arXiv:cond-mat/9805194v1

## Research Methods

An Agent-Based Model seems to be perfect for our simulations, we will get more precise on this when we clearly defined our model.