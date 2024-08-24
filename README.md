## Uniform distribution of particles on a triangulated surface

### 'ParticleLoadingInTriangle.m'

If $\vec{X}_1$, $\vec{X}_2$, and $\vec{X}_3$ are the 3 vertices of a triangle then a uniform distribution of particles in it can be generated as

$$ \vec{X}_p = (1-r_3)   \vec{X}_1 + (1-r_1) r_3   \vec{X}_2 + r_1 r_3   \vec{X}_3 $$

where $(r_i, r_2)$ are random numbers with uniform distribution in $[0,1]$, with $r_3 = \sqrt{r_2}$.

![TriSmall](https://github.com/user-attachments/assets/003923cb-9269-4143-a658-b2e883dab01d)


### 'ParticleLoading.m'

If $N_p$ is the total number of particles to be distributed on the surface, then the number of particles in the $i^{th}$ triangle with area $A_i$ is given by, 

$$ N_i = ROUND\left( N_p \frac{A_i}{\sum_j A_j} \right) $$

![Knot](https://github.com/user-attachments/assets/2229268d-ff9d-4860-98ec-05d97ca9a81e)

**NOTE**: Typically $N_p \ne \sum_i N_i$.
