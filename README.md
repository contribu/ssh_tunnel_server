## Usage

docker-compose.yml example

```yaml
version: '2'
services:
  target_host:
    ...
  ssh_tunnel:
    image: contribu/ssh_tunnel_server
    ports:
    - "10022:22"
    environment:
    - "SSH_AUTHORIZED_KEY=ssh-rsa ..."
    - "SSH_PERMIT_OPEN=target-host:20000"
    links:
    - target_host:target-host
```

create tunnel (-N required)

```bash
ssh -N -L 30000:target-host:20000 root@container-host -p 10022
```

- 20000: arbitrary port for communication between target_host and ssh_tunnel containers
- 30000: arbitrary port for listen to connection for using tunnel
- 10022: arbitrary port for SSH

## Customization

### Environment Variables

#### SSH_PERMIT_OPEN

space separated list of ssh tunnel target host:port

Example

target-host:12345

#### SSH_AUTHORIZED_KEY

a public key used to connect this container

## Details

Please see following files

- boot.sh: sshd start script
- Dockerfile
- sshd_config.erb: ERB template of sshd_config. Regenerated by boot.sh before starting sshd. 