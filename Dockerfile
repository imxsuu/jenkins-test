FROM jenkins/jenkins:lts
# Disable setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
#RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# Set a CasC env
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/casc.yaml
# JCasC by using CasC.yaml
COPY casc.yaml /usr/share/jenkins/ref/casc.yaml
