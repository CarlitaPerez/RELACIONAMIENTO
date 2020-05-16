####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)
# CODIGO MODIFICADO EN DIA VIERNES

# video 02 - RELACIONAMIENTO "CASO REAL": EXPORTACIONES HIDALGUENSES

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, métrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz de datos
# 2. Calcular co ocurrencias entre lugares y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar
# 5. Exportar los resultados para trabajarlos con cytoscape o gephi

#######################################
# practica 2: exportaciones hidalguenses #
#######################################

library (EconGeo)

# 1.Cómo se mide la proximidad (relatedness) para crear el espacio producto
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r



M = as.matrix(
  read.csv("~/ENE-JUN 2020/INVESTIGADORA/practicas r/rca_2014.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

head (M[,1:10])
dim (M)




co.occurrence (M)
# co-ocurrencia entre personas/paises/estados





c = co.occurrence (t(M))
# co-ocurrencia entre productos t es transpuesta




r = relatedness (c)
# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado


#exportar resultados del relacionamiento no binario
write.csv (r, file="relatedness.csv")

#opcional (sólo para trabajar con datos binarios)
r[r<1] = 0
r[r>1] = 1




library (igraph)
g1 = graph_from_adjacency_matrix (r, mode = "undirected")

plot(g1)



#exportar resultados del relacionamiento binario
write.csv (r, file="relatednessbinario.csv")
#exportar resultados de co ocurrencias
write.csv (c, file="cocurrences.csv")


