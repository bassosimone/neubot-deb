# Public domain.  Simone Basso <bassosimone@gmail.com>

.PHONY: all clean

all:
	fakeroot make -f Makefile _all

_all:
	cp -Rp control _control
	cp -Rp data _data
	find _control _data -exec chown root:root {} \;
	cd control && tar czf ../control.tar.gz *
	cd data && tar czf ../data.tar.gz *
	ar r neuprivacy-0.0.1-1.deb debian-binary \
		control.tar.gz data.tar.gz
	chmod 644 neuprivacy-0.0.1-1.deb

clean:
	rm -rf _control _data
	rm -rf control.tar.gz data.tar.gz
	rm -rf neuprivacy-0.0.1-1.deb
