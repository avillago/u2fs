# u2fs
## Utility metric for Unsupervised Feature Selection - functions and code to generate simulated data.

U2FS algorithm described in "Utility metric for unsupervised feature selection"
Amalia Villa, Abhijith Mundanad Narayanan, Sabine Van Huffel, Alexander Bertrand, Carolina Varon

Contact: amalia.villagomez@kuleuven.be

Contains:

- **u2fs.m** : U2FS code of the full algorithm. Requires sigHighDim and utiSelect to run
	- **sigHighDim.m** : Code to approximate the RBF kernel parameter, robust to high dimensional data.
	- **utiSelect.m** : Utility metric for subset selection

- **createDatasetsSimulation.m** : code to generate simulation data. Clustering data presenting non-linearities, with extra irrelevant/redundant features. Uses the codes in the folder **./datasetsSimulation** which contain:
	- **twospirals.m**
	- **halfkernel.m**
	- **corners.m**
	- **crescentfullmoon.m**