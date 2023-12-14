from string import ascii_lowercase
from matplotlib import pyplot as plt
import networkx as nx
import itertools
import random


def generate_random_connected_graph(size: int, probability: float, connected = True, **kwargs):
    """Gera um grafo conexo aleatório. O algoritmo é simples:
    ele gera um grafo com arestas aleatórias, com probabilidade
    {probability} de uma aresta existir entre dois vértices quaisquer,
    e, caso o grafo não seja conexo, o algoritmo é executado novamente.
    """
    g = nx.Graph()
    nodes = range(0, size)
    
    while True:
        for node in nodes:
            g.add_node(node, **kwargs)
            
        for node_1, node_2 in itertools.combinations(nodes, 2):
            if probability > random.random():
                weight = random.randint(0, 10)
                g.add_edge(node_1, node_2, weight=weight)
                
        if nx.is_connected(g) or not connected:
            return g


def draw_graph(grafo: nx.Graph, layout_func = nx.spring_layout):
    """Desenha o grafo utilizando a API da NetworkX."""
    pos=layout_func(grafo)
    edge_labels = nx.get_edge_attributes(grafo, "weight")
    
    nx.draw_networkx(grafo, pos=pos)
    nx.draw_networkx_edge_labels(grafo, pos, edge_labels)
    
    
if __name__ == "__main__":
    g = generate_random_connected_graph(100, 0.2)
    draw_graph(g)
    
    for u, v, d in g.edges(data=True):
        print(d["weight"])
        
    plt.show()
    