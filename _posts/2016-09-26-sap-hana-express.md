sap

This is a hands-on tutorial on installing SAP HANA Express as a virtual instance
under VMWare Fusion 8 on a Mac.

https://go.sap.com/cmp/ft/crm-xu16-dat-hddedft/typ.html

0. Click Other to download
   HXEDownloadManager.jar

0. Run it to open the Download Manager GUI.

0. Keep defaults of Image Virtual Machine checked
   and only the "Getting Started" checked.
   (We can get more later)
0. Click Download for just the API.
0. Click OK for the pop-up.

   NOTE: Don't quit the Download program yet.

0. Open "Getting_Started_HANAexpress_VM.pdf" downloaded.
   I've found a better one at:<br />
   https://go.sap.com/developer/tutorials/hxe-ua-installing-vm-image.html


## Server-only #

0. Select "Server only" and press OK.

   Selecting "Server + applications" means <strong>development apps</strong>, which include XS Advanced (XSA) and Web IDE.

   http://sap.com/sap-hana-express<br />
   is a vanity URL that reroutes to:<br />
   https://go.sap.com/cmp/ft/crm-xu16-dat-hddedft/index.html

0. In VMWare, select "Open a Virtual Machine".

0. Click Play.

   The pdf downloaded provides these credentials:

   * At the hxehost login prompt, enter hxeadm
   * For Password enter the temporary password HXEHana1
   <br /><br />

0. Follow the Getting Started to change passwords, assign IP, etc.
   
   QUESTION: Is there a shell script that can do all that?

   It will "stop working after the default grace period of 60-90 days."

0. Start SAP HANA studio to get the Hardware Key for registration on <br />
   http://sap.com/minisap

