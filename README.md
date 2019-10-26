# Deploy HA cluster based by nginx and haproxy
### Requirments:
1. Linux(Unix) system
2. Docker engine 19.x
3. Free ports 8081 and 8082

### How to deploy
just execute sh script:  
 ```./deploy.sh```

### How to check
open webpage:  
```http://yourdomain:8081(8082)```


haproxy status pages:  
```http://yourdomain:8081/haproxy?stats```
```http://yourdomain:8082/haproxy?stats```
