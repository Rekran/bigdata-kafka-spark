FROM jupyter/pyspark-notebook

# Install additional packages
RUN pip install kafka-python

#Give permissions to the jovyan user
USER root
RUN chown -R jovyan /home/jovyan/work

# Switch back to jovyan to avoid accidental container runs as root
USER jovyan
# Copy the notebook to the container
COPY ./notebooks /home/jovyan/work

# Set the working directory
WORKDIR /home/jovyan/work

# Expose the port
EXPOSE 8888
