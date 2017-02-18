# Rope-Physics
A program to simulate the physics of a rope dfasdfby solving for its equations of motion.

To run the example, type `runExample` in the Matlab console.

The important files are:
* runExample - contains example code that sets up the physics, solves for the equations of motion and runs a simulation.
* setupRopeWorkspace - creates necessary variables for other scripts to run (at the moment, only ropeRigid)
* ropeRigid - sets up the physics for a rigid rope (a rope that does not stretch)
* playbackSnapshots - computes the coordinates of every point on the rope for every frame in the simulation, and then runs the simulation.
* simulate - simulates a physical system given its equations of motion and returns a matrix where every row contains the parameters of the system at a certain time.

The other files are documented, but the best way to understand their usage is by reading through the scripts above.
