#!/bin/sh
print_separator()
{
   echo "=================================================================="
   echo "          deploying $1"
   echo "=================================================================="
}

deploy_mongo()
{
   print_separator mongodb
   cd ./charts/mongodb-7.4.4
   helm install -f values.yaml -f ../../env/dev/helm/mongo.yaml newvision-mongodb .
   cd ../..
}

deploy_kafka()
{
   print_separator kafka
   cd ./charts/kafka-6.1.6
   helm install -f values.yaml -f ../../env/dev/helm/kafka.yaml newvision-kafka .
   cd ../..
}

deploy_neo4j()
{
   print_separator neo4j
   cd ./charts/neo4j-1.2.2
   helm install -f values.yaml -f ../../env/dev/helm/neo4j.yaml newvision-neo4j .
   cd ../..
}

deploy_cassandra()
{ 
   print_separator cassandra
   cd ./charts/cassandra
   helm install -f values.yaml -f ../../env/dev/helm/cassandra.yaml newvision-cassandra .
   cd ../..
}


deploy_configs()
{
  print_separator "swapy configs & secrets"
  cd ./charts/newvision-configs
  helm install  -f ../../env/dev/helm/newvision-configs.yaml newvision-config .
  cd ../..
}


for param in $@
do
   case $param in 
	    mongodb)
		    deploy_mongo
		   ;;
	    kafka)
		    deploy_kafka
		   ;;
	    neo4j)
		    deploy_neo4j	
		   ;;
            cassandra)
		    deploy_cassandra
		   ;;
	    
		  newvision_configs)
		    deploy_configs
		    ;;
 	    all)
		   deploy_mongo
		   deploy_kafka
		   deploy_neo4j
		   deploy_cassandra
		   deploy_configs
		   ;;
	   *)
		   echo "invalid param"
		   ;;
  esac
done
