FROM alpine:3.18

RUN apk add --no-cache build-base libmodbus-dev

# Create a simple Modbus server in C
RUN cat << 'EOF' > /modbus_server.c
#include <modbus/modbus.h>
#include <stdio.h>
#include <unistd.h>

int main() {
    modbus_t *ctx = modbus_new_tcp("0.0.0.0", 502);
    modbus_mapping_t *mb_mapping = modbus_mapping_new(0, 0, 100, 100);

    if (ctx == NULL || mb_mapping == NULL) {
        printf("Failed to create modbus server\n");
        return -1;
    }

    int server_socket = modbus_tcp_listen(ctx, 1);
    modbus_tcp_accept(ctx, &server_socket);

    printf("Modbus TCP server running on port 502...\n");

    while (1) {
        uint8_t query[MODBUS_TCP_MAX_ADU_LENGTH];
        int rc = modbus_receive(ctx, query);
        if (rc > 0) {
            modbus_reply(ctx, query, rc, mb_mapping);
        }
    }

    modbus_mapping_free(mb_mapping);
    modbus_free(ctx);
    return 0;
}
EOF

# Compile the server
RUN gcc /modbus_server.c -o /modbus_server -lmodbus

EXPOSE 502

CMD ["/modbus_server"]
