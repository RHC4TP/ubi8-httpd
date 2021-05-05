## Sample UBI 8 Apache web server

# UBI 8 Standard image
FROM registry.access.redhat.com/ubi8/ubi

# Required Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels
LABEL name="ubi8-httpd" \
      vendor="Red Hat" \
      version="0.1.0" \
      release="1" \
      summary="UBI 8 Apache server" \
      description="Apache web server for UBI 8" \
      maintainer="rhc4tp"

# Update base image
RUN yum update --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos -y && rm -rf /var/cache/yum

# Install httpd
RUN yum install --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos httpd -y && rm -rf /var/cache/yum

# Add default Web page
RUN echo "The Web Server is Running" > /var/www/html/index.html

# Expose port
EXPOSE 80

# Start the service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Always include a software license in the default location
# Required for Red Hat container certification
COPY licenses/ /licenses
