FROM quay.io/fedora/fedora-bootc:40

RUN dnf -y install \
  cloud-init \
  virtiofsd \
  virt-manager-common \
  virt-manager \
  virt-viewer \
  virt-install \
  virt-what \
  podman \
  skopeo \
  buildah \
  libvirt-gconfig \
  libvirt-glib \
  libvirt-gobject \
  libvirt-libs \
  libvirt-daemon-lock \
  libvirt-daemon-log \
  libvirt-daemon-plugin-lockd \
  libvirt-client \
  libvirt-daemon-common \
  libvirt-daemon-driver-storage-core \
  libvirt-daemon-driver-network \
  libvirt-daemon-driver-nwfilter \
  libvirt-daemon-driver-interface \
  libvirt-daemon-driver-nodedev \
  libvirt-daemon-driver-qemu \
  libvirt-daemon-driver-secret \
  libvirt-daemon-proxy \
  libvirt-daemon \
  libvirt-daemon-config-nwfilter \
  libvirt-daemon-config-network \
  libvirt-daemon-driver-lxc \
  libvirt-daemon-driver-storage-disk \
  libvirt-daemon-driver-storage-gluster \
  libvirt-daemon-driver-storage-iscsi \
  libvirt-daemon-driver-storage-iscsi-direct \
  libvirt-daemon-driver-storage-logical \
  libvirt-daemon-driver-storage-mpath \
  libvirt-daemon-driver-storage-rbd \
  libvirt-daemon-driver-storage-scsi \
  libvirt-daemon-driver-storage-zfs \
  libvirt-daemon-driver-storage \
  libvirt-daemon-driver-libxl \
  libvirt-daemon-driver-vbox \
  libvirt-client-qemu \
  libvirt \
  libvirt-daemon-kvm \
  libvirt-nss \
  lvm2 \
  git \
  neovim \
  tcpdump

COPY alternate-ssh-port.conf /etc/ssh/sshd_config.d/alternate-ssh-port.conf
RUN semanage port -a -t ssh_port_t -p tcp 2222


COPY systemd/bootc-fetch-apply-updates.timer.d/override.conf \
  /etc/systemd/system/bootc-fetch-apply-updates.timer.d/override.conf

RUN mkdir -p /usr/local/bin
COPY bootc-image-builder /usr/local/bin/
