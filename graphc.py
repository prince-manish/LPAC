inputfile = "path.txt"
file=open(inputfile,'r') 
outfile="graph_colour.dat"
line=file.readline()
path_count=1
path_with_node={}

p1=""
p2=""
while line: # RUNS UNTIL 'EOF' IS RECEIVED
    nodes = line.split('-')  # LIST OF nodesS
    #print()
    p1 = "path"+str(path_count)
    #print (p1 ,"with nodes", end=":")
    L=[]
    for w in nodes:
        L.append(w.replace('\n',''))
    path_with_node[p1] = L
   # print(path_with_node)
    line=file.readline()
    path_count += 1
    
file.close()
#print()
#print()
graph={}
p1=1
p2=0
for k,v in path_with_node.items():
    #print(k,v)
    p2=0
    for k2,v2 in path_with_node.items():
        p2 += 1        
        len_v = len(v)
        len_v2 = len(v2)
        graph[ (str(p1) +" "+str(p2)) ] = 0
        for i1 in range(1,len_v):
            for i2 in range(1,len_v2):                
                if v!=v2 and v[i1-1:i1+1] == v2[i2-1 : i2+1]:
                    graph[ (str(p1) +" "+str(p2)) ]= 1 
                    #print("-----",v[i1-1:i1+1], v2[i2-1 : i2+1])
                    #break
            #print("path",p1,", graph=",graph)
    p1 += 1

#print("FINAL graph=",graph)
# WRITE TO OUTPUT FILE
file_out=open(outfile,'w')
s = "/* graph -color - "+outfile+" */\n\n param N := "+str(path_count-1)+" ;\n\n param : E : AM :=\n"
file_out.write(s)

for k,v in graph.items():
    file_out.write(" "+str(k) + " " + str(v) +  "\n")
file_out.write(";\nend ;")    

file_out.close()
