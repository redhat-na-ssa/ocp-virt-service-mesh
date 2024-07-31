export SLEEP=20

NC='\033[0m'       # Text Reset

BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

clear

oc apply -f k8/virtualservice-service-b-100-0.yaml
echo "${BGreen}All${NC} traffic is routed to ${BGreen}v1${NC}"
sleep $SLEEP
oc apply -f k8/virtualservice-service-b-90-10.yaml
echo "${BGreen}90%${NC} traffic is routed to ${BGreen}v1${NC} ${BYellow}10%${NC} to ${BYellow}v2${NC}"
sleep $SLEEP
oc apply -f k8/virtualservice-service-b-75-25.yaml
echo "${BGreen}75%${NC} traffic is routed to ${BGreen}v1${NC} ${BYellow}25%${NC} to ${BYellow}v2${NC}"
sleep $SLEEP
oc apply -f k8/virtualservice-service-b-50-50.yaml
echo "${BGreen}50%${NC} traffic is routed to ${BGreen}v1${NC} ${BYellow}50%${NC} to ${BYellow}v2${NC}"
sleep $SLEEP
oc apply -f k8/virtualservice-service-b-25-75.yaml
echo "${BGreen}25%${NC} traffic is routed to ${BGreen}v1${NC} ${BYellow}75%${NC} to ${BYellow}v2${NC}"
sleep $SLEEP
oc apply -f k8/virtualservice-service-b-10-90.yaml
echo "${BGreen}10%${NC} traffic is routed to ${BGreen}v1${NC} ${BYellow}90%${NC} to ${BYellow}v2${NC}"
sleep $SLEEP
oc apply -f k8/virtualservice-service-b-0-100.yaml
echo "${BYellow}All${NC} traffic is routed to ${BYellow}v2${NC}"


