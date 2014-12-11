FROM fedora:21

MAINTAINER Martin Janser <martin@duss-janser.ch>

RUN yum -y install eclipse-platform \
    eclipse-dltk-ruby \
    eclipse-pydev \
    eclipse-texlipse \
    eclipse-mylyn \
    eclipse-mylyn-versions-git \
    eclipse-mylyn-tasks-web \
    eclipse-egit \
    eclipse-egit-github \
    eclipse-egit-mylyn \
    eclipse-anyedit \
    eclipse-changelog \
    eclipse-color-theme \
    eclipse-quickrex \
    eclipse-shelled \
    eclipse-vrapper \
    eclipse-pdt \
    eclipse-pdt-mylyn \
    eclipse-wtp-common \
    eclipse-wtp-sourceediting

RUN yum -y install xauth \
    PackageKit-gtk3-module \
    libcanberra-gtk3 \
    libcanberra-gtk2 \
    gnome-themes-standard \
    dejavu-sans-mono-fonts

RUN useradd --uid ${UID} --user-group --create-home --shell /bin/bash ${USER}

RUN sed -e '/^-protect$/d' -e '/^master$/d' -i /usr/lib64/eclipse/eclipse.ini

# PDT extensions
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.pdtextensions.feature.feature.group"
# Symfony tools
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "com.dubture.composer.feature.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "com.dubture.doctrine.feature.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "com.dubture.symfony.feature.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "com.dubture.twig.feature.feature.group"
# PHP Tools
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.phpsrc.eclipse.pti.core.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.phpsrc.eclipse.pti.library.pear.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.phpsrc.eclipse.pti.tools.codesniffer.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.phpsrc.eclipse.pti.tools.phpunit.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.phpsrc.eclipse.pti.tools.phpcpd.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.phpsrc.eclipse.pti.tools.phpmd.feature.group"
# Editors
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "markdown.editor.feature.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.psem2m.eclipse.rest.editor.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.dadacoalition.yedit.feature.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "org.sourceforge.jsonedit.feature.feature.group"
# Other
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "com.piece_framework.makegood_feature.feature.group"
#RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "com.wdev91.eclipse.copyright.feature.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://p2-dev.pdt-extensions.org/,http://download.eclipse.org/releases/kepler" -installIU "de.anbos.eclipse.logviewer.feature.feature.group"
RUN eclipse -clean -application org.eclipse.equinox.p2.director -noSplash -repository "http://workspacemechanic.eclipselabs.org.codespot.com/git.update/mechanic" -installIU "com.google.eclipse.mechanic.feature.group"

EXPOSE 9000

USER ${USER}
ENV HOME ${HOME}

CMD ["/usr/bin/eclipse"]
