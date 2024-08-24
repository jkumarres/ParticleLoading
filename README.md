# Code to generate a uniform distribution of particles on a triangulated surface

If $\vec{X}_1$, $\vec{X}_2$, and $\vec{X}_3$ are the 3 vertices of a triangle then a uniform distribution of particles in it can be generated as

$$ \vec{X}_p = (1-r_3)   \vec{X}_1 + (1-r_1) r_3   \vec{X}_2 + r_1 r_3   \vec{X}_3 $$

where $(r_i, r_2)$ are random numbers with uniform distribution in $[0,1]$, with $r_3 = \sqrt{r_2}$.

