# alpine-strongswan

put the normal strongswan /etc files and folders in a folder names 'config'

then start the container using:

# shared network with host, privileged container
docker run -d  \
 --privileged \
 --net=host \
 -v $PWD/config/strongswan.conf:/etc/strongswan.conf:ro \
 -v $PWD/config/strongswan.d/charon.conf:/etc/strongswan.d/charon.conf:ro \
 -v $PWD/config/ipsec.conf:/etc/ipsec.conf:ro \
 -v $PWD/config/ipsec.secrets:/etc/ipsec.secrets:ro \
 -v $PWD/config/ipsec.d:/etc/ipsec.d:ro \
 --name=strongswan \
 thinghub/alpine-strongswan

# confined network, container
docker run -d  \
 --cap-add=NET_ADMIN \
 -p 500:500/udp -p 4500:4500/udp -p 1701:1701/udp \
 -v $PWD/config/strongswan.conf:/etc/strongswan.conf:ro \
 -v $PWD/config/strongswan.d/charon.conf:/etc/strongswan.d/charon.conf:ro \
 -v $PWD/config/ipsec.conf:/etc/ipsec.conf:ro \
 -v $PWD/config/ipsec.secrets:/etc/ipsec.secrets:ro \
 -v $PWD/config/ipsec.d:/etc/ipsec.d:ro \
 --name=strongswan \
 thinghub/alpine-strongswan
