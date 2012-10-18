# MATLAB HS12 – Research Plan


> * Group Name: Crazy Scientists Without Opinions
> * Group participants' names: 
Mayra Bermudez
Veronika Boskova
Sarah Grimm
Rzgar Hosseini

> * Project Title: Network-Based Modeling for the Spread of Scientific Ideas

## General Introduction

In contrast to opinions, scientific ideas are considered to be unlimited in number. Especially due to its high dynamics conditioned by human capacity of invention, the field of science constantly abandons old ideas, when some better, new theories are developed. New ideas in science emerge only very rarely; however, they tend to spread very fast and are eroded slowly, until replaced by newer ones. 

To simulate real-world situations, several groups looked at grid-based simulations of agents and spread of their opinions, allowing unrestricted amount of ideas to flow through system, by introducing innovation rate as property of individual agents (Bornholdt et al., 2011). We extend these studies by setting the above-mentioned model on the network, to approximate the model to true world structure. 

## The Model

We want our model to include the following parameters:

Probability of innovation (independent or dependent): This value represents the probability of each agent (node in the network) to produce a new ‘idea’.  Infinitely many new ideas may arise. We want to observe the effects of changing it from a uniform value for all agents to one that varies between agents. This variation can either be defined by randomly choosing agents (hence, providing them with different ‘personality’ types or innovation) or by making it proportional to the connectivity of the node. This second definition is encouraged by the idea that to be innovative one must be well connected to other agents in a network.

Probability of changing the structure of the network: this parameter will represent the likeliness of agents to change their connections with agents they do not share opinions (or ideas) with to those with which they do. This will allow us to investigate whether the structure of the network affects opinions or whether opinions affect the structure of the network. 

Probability of skepticism: this value has not been included in previous models. By delaying the time in which a randomly chosen node (agent) is updated, we hope to represent an agent’s skepticism or time to accept a new idea. 

Probability of changing opinion/idea: the possible ideas that an agent (node) can adopt are the ones that it is directly connected to. The probability of adopting any of these possible ideas will be 
(Number of connected agents that have this idea) / (number of agents that are connected to the agent in question)

Potentially: we want to vary whether agents can or cannot come back to a previously held idea.


## Fundamental Questions

How are novel ideas spread in networks?

Do networks shape opinions and ideas, or do opinions and ideas shape networks? We plan to investigate the distribution of the sizes of clusters in the network based on changing the probability of changing the structure of the network.

Do life spans and speeds of degradation of ideas change depending on individual levels of agent innovation? Do they change by introducing skepticism of agents?

Do predominant ideas originate from specific kinds of agents? What is more important for the spread of ideas: good network connectivity, or high levels of innovation? We plan to keep track of which agents produced innovative ideas to be able to investigate this question.

What interactions occur between innovation, skepticism, connectivity, and levels of changing network structure? 


## Expected Results

Based on previous research, we expect an interaction between network structure and the spread of opinions. In previous research using a grid instead of a network, the system was very dynamic, fluctuating between having one or two predominant ideas. 

We also predict that the connectivity of an agent in the network will be more important than innovation for the spread of ideas.  Thus, poorly connected nodes, even if highly innovative, will not be the origin of a predominant idea. 

Previous research using a grid instead of a network has shown that, at different but uniform levels of innovation, the life span of ideas did not change, but their speed of degradation did. We expect similar behavior on netwoks if unifrom innovation rates are introduced. However, we expect slower idea propagation through the system (rise), when coming from low-connected nodes. With introducing the concept of varying innovation rates to different agents, we expect more dynamic behavior, with unequal period lengths corresponding to varying node connectivities and innovation rates. Scepticism of agents in network would potentially also prolong the individual paradigm periods.

We would also expect a mutual interaction between network structure and scientific idea formation.

## References 

Bornholdt, S., Mogens Høgh Jensen, and Kim Sneppen. "Emergence and Decline of Scientific Paradigms." Physical review letters 106, no. 5 (2011): 58701.

Holme, Petter, and Mark EJ Newman. "Nonequilibrium phase transition in the coevolution of networks and opinions." Physical Review E 74, no. 5 (2006): 056108.

S. Brugger and C. Schwirzer, "Opinion formation by "employed agents" in social networks." Project work done in the course Lecture with Computer Exercises: Modelling and Simulating Social Systems with MATLAB, May 2011, 2011.


## Research Methods

Currently we intend on using network-based modeling under discrete time. Further information on methods will be provided as they are researched.

## Other

(mention datasets you are going to use)
