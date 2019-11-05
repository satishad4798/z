
sudo ip netns add red
sudo ip netns add blue

sudo ip link add eth0 type veth peer name eth1

sudo ip link set eth0 netns red
sudo ip link set eth1 netns blue


sudo ip netns exec red ip link set eth0 up
sudo ip netns exec blue ip link set eth1 up

sudo ip netns exec red ip address add 10.0.0.1/24 dev eth0
sudo ip netns exec blue ip address add 10.0.0.2/24 dev eth1

sudo ip netns exec red ping 10.0.0.2

sudo ip netns delete red
sudo ip netns delete blue

