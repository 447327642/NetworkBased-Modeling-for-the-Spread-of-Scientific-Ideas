# MATLAB HS12 – Research Plan


> * Group Name: Crazy Scientists Without Opinions
> * Group participants' names: 
Mayra Bermudez,
Sarah Grimm,
Rzgar Hosseini

> * Project Title: Network-Based Modeling for the Spread of Scientific Ideas

## General Introduction

How do scientific ideas spread? The field of science constantly abandons old ideas when some better, new theories are developed. New ideas in science emerge only very rarely, perhaps due to human capacity of invention; however, they tend to spread very quickly and are eroded slowly, until replaced by newer ones. 

To simulate real-world situations, several groups looked at grid-based simulations of agents and spread of their opinions, allowing unrestricted amount of ideas to flow through the system, by introducing innovation rate as property of individual agents (Bornholdt et al., 2011). We extend these studies by setting the above-mentioned model on the network, to approximate the model to true world structure. 

## The Model

We want our model to include the following parameters:

Probability of innovation (independent or dependent): This value represents the probability of each agent (node in the network) to produce a new ‘idea’.  Infinitely many new ideas may arise. Potentially, we want to observe the effects of changing it from a uniform value for all agents to one that varies between agents. This variation can either be defined by randomly choosing agents (hence, providing them with different ‘personality’ types or innovation) or by making it proportional to the connectivity of the node. This second definition is encouraged by the idea that to be innovative one must be well connected to other agents in a network.

Probability of a node to change an edge: this parameter will represent the likeliness of agents to change their connections with agents they do not share opinions (or ideas) with to those with which they do. This will allow us to investigate whether the structure of the network affects opinions or whether opinions affect the structure of the network.

Probability of changing opinion/idea: this probability is 1 - (probability of changing structure). Different forms of contagion will be explored. A simple contagion would be that the possible ideas that an agent (node) can adopt are the ones that it is directly connected to, and thus the probability of adopting any of these possible ideas will be 
(Number of connected agents that have this idea) / (number of agents that are connected to the agent in question)

The following are not parameters, but are different starting points for the simulations:

Starting network structure: This may be one of
- random network
- small world network
- caveman network
- scale free network

Starting distribution of opinions: This may be one of:
- randomly assigned opinions
- opinions assigned in accordance to the network structure
- opinions assigned opposite to what the network structure would suggest



## Fundamental Questions

We would like to investigate two main influences: the influence of the structure of a network on the opinions in the network, and the influence of the opinions in a network on its structure.

I. Structure --> Opinion

Starting with the different network structures previously mentioned, and given a low probability of changing connections between nodes (thus a high probability of a node to change opinion), we will observe the resulting characteristics of the networks' opinions. Opinion characteristics will be determined by values such as the neighborhood index and average distance between similar opinions.


II. Opinion --> Structure
Starting with different opinion distributions as previously mentioned, and given a high probability of changing connections between nodes (therefore a low probability of a node to change opinion), we will characterize the resulting network structures. The network structures will be characterized by clustering coefficients, average distances, and the distribution of node degree.


The values that will be used to characterize opinions and structures will also be recorded during the simulations in order to observe the rates of change. Additionally, time and frequency of opinion dominance will be included in these values.



## Expected Results

Based on previous research, we expect an interaction between network structure and the spread of opinions. In previous research using a grid instead of a network, the system was very dynamic, fluctuating between having one or two predominant ideas. 

Previous research using a grid instead of a network has shown that, at different but uniform levels of innovation, the life span of ideas did not change, but their speed of degradation did. We expect similar behavior on netwoks if uniform innovation rates are introduced. However, we expect slower idea propagation through the system (rise), when coming from low-connected nodes.

We would also expect a mutual interaction between network structure and scientific idea formation.


## References 

Bornholdt, S., Mogens Høgh Jensen, and Kim Sneppen. "Emergence and Decline of Scientific Paradigms." Physical review letters 106, no. 5 (2011): 58701.

Holme, Petter, and Mark EJ Newman. "Nonequilibrium phase transition in the coevolution of networks and opinions." Physical Review E 74, no. 5 (2006): 056108.

S. Brugger and C. Schwirzer, "Opinion formation by "employed agents" in social networks." Project work done in the course Lecture with Computer Exercises: Modelling and Simulating Social Systems with MATLAB, May 2011, 2011.


## Research Methods

Currently we intend on using network-based modeling under discrete time. Further information on methods will be provided as they are researched.

## Other

(mention datasets you are going to use)
