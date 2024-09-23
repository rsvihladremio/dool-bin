FROM python:bookworm AS build

RUN mkdir /app
WORKDIR /app

RUN apt update && apt install -y binutils wget unzip && wget "https://github.com/scottchiefbaker/dool/archive/refs/tags/v1.3.2.zip" && unzip v1.3.2.zip && pip install pyinstaller 
RUN cd dool-1.3.2 && pyinstaller  --onefile ./dool && cp dist/dool /bin/dool

FROM scratch
COPY --from=build /bin/dool /
ENTRYPOINT ["/dool"]
