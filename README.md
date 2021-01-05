# u2fs
## Utility metric for Unsupervised Feature Selection - functions and code to generate simulated data.

U2FS is an unsupervised method to perform spectral feature selection. It consists of two stages: manifold learning and subset selection. In the first stage, the underlying structures in the high-dimensional data are extracted, while in the second stage a subset of the features is selected to replicate these structures.

The manifold learning stage can use 3 different embeddings: 
- A KNN approach with binary weighting
- An RBF kernel, with sigma approximated as the mean of the distances between data points
- An RBF kernel, with sigma approximated with a robust method designed for high-dimensional data. 

The stage of subset selection is based on the utility metric, a backwards greedy method that requires, as only input, the number of features to keep.

The details of the U2FS algorithm are described in "Utility metric for unsupervised feature selection"
Amalia Villa, Abhijith Mundanad Narayanan, Sabine Van Huffel, Alexander Bertrand, Carolina Varon

Contact: amalia.villagomez@kuleuven.be

______________________________________________________________________________________

The codes contain:

- **u2fs.m** : U2FS code of the full algorithm. Requires sigHighDim and utiSelect to run
	- **sigHighDim.m** : Code to approximate the RBF kernel parameter, robust to high dimensional data.
	- **utiSelect.m** : Utility metric for subset selection

- **createDatasetsSimulation.m** : code to generate simulation data. Clustering data presenting non-linearities, with extra irrelevant/redundant features. Uses the codes in the folder **./datasetsSimulation** which contain:
	- **twospirals.m**
	- **halfkernel.m**
	- **corners.m**
	- **crescentfullmoon.m**
	- **clouds.m**
	- **twomoons.m**

- **exampleCode.m** : example script to run the code
