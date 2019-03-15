# WumpusWorld
Solution for problem of finding all possible paths to the gold from initial agent's position (cell (1,1)) in Wumpus World.

# World
Initially board is 5x5 which contains one Gold (path to which agent should look for), any number of Pits (agent dies in that cell), one Wumpus and Stench around him (in cells which are up, down, left and right from Wumpus). <i>Note: there is no Breeze in current implementation.</i></br> 
Agent has possibility to move: go up, down, left and right; kill Wumpus having only one arrow initially. In case of Wumpus death agent can be in the same cell with Wumpus, otherwise he dies.

# Agent
There is Depth-First Search algorithm for finding possible path to Gold. Agent go through all paths and does not accept ones which do not follow rules (cases when agent dies). Output of the algorithm: printing all possible paths. 

# Run the program
Print the query:</br>
-? <b>start([[name_of_item,x,y],[...],...])</b> </br>
which contains list of lists with numbers of items and their positions <br>
where 
* <b>name_of_item</b> is a gold, pit or wumpus <br> 
<i>Note: input needs to contain exactly one Gold, no more than one Wumpus and any number of Pits</br></i>
* <b>x</b> and <b>y</b> are the positions of cell <br>
 <i>Note: Wumpus and Pit cannot be in cell (1,1)</i> <br>

Example: </br>
-? <b>start([[gold,1,3],[pit,3,1],[pit,3,2],[pit,3,3],[pit,2,4],[wumpus,5,5]])</b>
