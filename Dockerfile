FROM sabansal/freerdp1.1build
WORKDIR /freerdp
COPY ./ /freerdp
RUN ./buildfreerdp.sh