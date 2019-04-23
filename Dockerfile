FROM golang:alpine

# Vulnerability Advisor : Fix PASS_MAX_DAYS, PASS_MIN_DAYS and PASS_MIN_LEN, common-password
# RUN touch /etc/login.defs.orig
# RUN sed 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 90/' /etc/login.defs.orig > /etc/login.defs
# RUN grep -q '^PASS_MIN_DAYS' /etc/login.defs && sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS 1/' /etc/login.defs || echo 'PASS_MIN_DAYS 1\n' >> /etc/login.defs
# RUN grep -q '^PASS_MIN_LEN' /etc/login.defs && sed -i 's/^PASS_MIN_LEN.*/PASS_MIN_LEN 8/' /etc/login.defs || echo 'PASS_MIN_LEN 9\n' >> /etc/login.defs
# RUN grep -q '^password.*required' /etc/pam.d/common-password && sed -i 's/^password.*required.*/password    required            pam_permit.so minlen=9/' /etc/pam.d/common-password || echo 'password    required            pam_permit.so minlen=9' >> /etc/pam.d/common-password
#

COPY helloworld.go /
RUN go build -o /helloworld /helloworld.go
ENTRYPOINT [ "/helloworld" ]
