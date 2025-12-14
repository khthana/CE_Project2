object Form4: TForm4
  Left = 0
  Top = 4
  Width = 800
  Height = 554
  Caption = 'Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = Query1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    object Label6: TLabel
      Left = 32
      Top = 128
      Width = 76
      Height = 16
      Caption = #3609#3634#3618' '#3648#3629#3609#3585' '#3591#3634#3617#3586#3635
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object QRSysData3: TQRSysData
      Left = 689
      Top = 1070
      Width = 91
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1822.97916666667
        2831.04166666667
        240.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDateTime
      Transparent = False
      FontSize = 10
    end
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 107
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.104166666667
        1899.70833333333)
      BandType = rbPageHeader
      object QRImage1: TQRImage
        Left = 0
        Top = 0
        Width = 105
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.8125
          0
          0
          277.8125)
        Picture.Data = {
          0A544A504547496D6167652C1B0000FFD8FFE000104A46494600010100000100
          010000FFDB0043000B08080A08070B0A090A0D0C0B0D111C12110F0F1122191A
          141C29242B2A282427272D3240372D303D302727384C393D43454849482B364F
          554E465440474845FFDB0043010C0D0D110F1121121221452E272E4545454545
          4545454545454545454545454545454545454545454545454545454545454545
          45454545454545454545454545FFC00011080089008B03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F5CA
          28A2800A28A8AE6EA1B384CB3B8441DCF7A06936EC896AA5DEA96963C4F32863
          C041CB13F4AC4BFD66E272634DF6EB8DDE5A63CD2BEAC4F11AFBB63F1AE71759
          33DC35AE8B04D7F723EF8B13B517FDF9DB93FF0001DA3DEB1753A44EEA783D39
          AA3FEBD7FAF53ABBAF11BC432B6EB029E15EF251167FE02793F8556FED7D427E
          5672A338CC1652BAFF00DF4CA07EB59D69E16D7EE3E7B8BFB5D255F0592C22DD
          237FBD237CD9F7C9ABA3E1E6952387BFB8BFBF7EE6E2E0F3F96295AA334E6C2C
          345F95FF003D3EE23FED2D4DB937376A4FF09B6841FC8C99A7A6ABAA247E679F
          39FF00666D3DF039EE63DD538F87BE1A031FD9C4FB99E4FF00E2A987E1EE8884
          35A2DD5A483A3C170D91F9E68E49F7FC595F58C3BD1AFF00C957F98EB7F135D1
          6DAD6D05E11F7BEC7365C7FDB33F37E95A767E20D3EF65F2566314FD0C332EC6
          07D39EF58575E14D5A2402D7554BF894E560D522127FE3FD47E18AC9BA9E4B6D
          B6FAFD9496ABD11AE099E03ECB20F9E3CE3D5B1E953CD386E5AA187AFF0006FE
          5BFDCF7F95BD4F46A2B8AB2D46FB4DF2C5AB9BA818656DA6903961FF004C651C
          3FD383ED5D3E97ABDA6AF0B3DB39DE871244E30F19F422B58D452D3A9C35B0B3
          A4B9B75DFF00CFFAB7665EA28A2B439428A28A0028A2A3B8B88ED6079A538441
          9340D26DD9115F5F4763087705998ED445EAC7D0571DABEB296E0DDDE4E0386D
          A367CC55BFB912F467E9963C29F534ED6F565B649AEEF77A9002B0538640C3E5
          893FDB61C93FC2BEE6AD785FC30C244D635A894DF328FB3DB6DF92CD3B2A8F5F
          7FEB92706DCDD91E94630C3439A5AB7FD7F5DFD0A5A6F856F75D559F5D0F67A7
          96F3134D473BA427F8A66EA5BF5FA74AED6D2CEDAC2DD6DECE08E0857A246A14
          0FCAA6A3A56B18A8EC70D5AD3AAEF20A0903A9C5539AF556E440BBB3B77975C1
          C0FA77AC3D6B561632C73090B6010D18CA86FAA9E80F3EBD3F1A529A8AB954B0
          F3AB2515D4E97CE8C1C6EE78EDEF8A559158E15813E9FA579F4FE364470E884E
          D52393C924E727FCF5A93C29AA9BFBEBF95EE671BD862DE49151157AA9273BBD
          7851D073D6B355E32764764F2CAB4E9BA93D0EFE9B2469346D1CA8AE8C30CAC3
          208F7158D6DAF5BFF68DCD9CF3DADBADAAA10038DAC08ECC71D3D315AF0DC437
          31F9904A92A1FE2460C3F315AA9296C70CE94E9BF797F4F5397D47C24F6BE6CF
          A0945590EE974F9B9866FA7F74FA1FE558B1C8D712B5C4334B677F6B80EF28FD
          E41D3E59BFE7A46781BF191C6EC8AF46AC5D77411A815BCB36106A707314C3F8
          BFD96F553FE7B8394E97589DF86C6BBF2D57F3FF003EEBFAD5683B43D746A7E6
          5ADDC7F66D4ADFFD7407BFFB4BEAA7FAFD09D8AF3B0D2DC18A5B5516B7F69218
          E35CFF00A893FE78B73CC6FCEDF43F2F7AECF44D5E3D6B4E5B94531C80949A26
          EB1B8EAA69D29DF46678CC32A6F9E0B4EABB3FF27D3F5D1BD1A28A2B63CF0AE7
          359BD696EBCB8F6B2C0C1555BEEB4C72467FD9500B1F61EF5B77F742CAC66B86
          FE05247D7B5705AE09DA08F4EB76FF004BBC7166A4F667C34CFEE00DA9F4DD59
          547D11DD83A69B737D3FA64FE17D3975FD58EAF302FA7593B2D9071CCD267E79
          9BDF3FE1FC35DF557D3EC61D32C20B3B65DB0C0811477E3B9F7AB15718F2AB1C
          D5AABAB3721934AB0C4CEC400067938CD558AFA1BCB35922B804E42B791890AB
          60657807D6A86A3A9A4DA648C264B76594C6CD9DC071D47A8ACDF065C1BAB5BE
          48F5249A46BA666611056DBB557804F1D073C8E7D7A4F3DE5646CB0ED527525D
          1FF5D2C6678E2F6EA1BB8AD61827925B850B165412DCF41B7DF1EFF9D739E20D
          46461E4C990F1929C8656201C7CCAC49078CE33DEBB5D5B53821D714D9234F71
          15B3EE61C15190492EDC2818EBCE33C0E6B00F83EEF54B892F6FE748E62017B7
          084A066202464E73920E49EA320F26B9270726EC7BB85C4D3A14E1ED15ACB4EE
          DBF2EC72D069B3CD60F72049956705361E02EC0C7F0320FC8D68F866FCC3F6AB
          24F2D4CE8C4334B2212D8E3A6571FEF01D7A8AE8ACCE996D7F63A6659977CE8C
          84F0E9315455CE7B0DBC7FB34C1E0EBCD2261A96917EE2EEDDDA3B849802ACBD
          73C0FBA46D38E719EB914952D6F1369E3B9A1ECEB6EF55DB7D3F4FBC87C11A8D
          EDDEB3797173733DADBA858C1914792EE001B4E401B80DBDC1FAE6BBDBCBC974
          FB5692696177EA308541008CF73DAB96D0F555B2D7AEEC0C1F64BAB9910FD815
          3747BBCBF99830E83001EFC76EF5A9E276823B145F3DACD7E61208BEF2838CF4
          35D1195A9E9D0F1EBD373C52525A3B6DDADD3F2D343A0B6B98AF2DD2781F7C4E
          32AD8233F9D4B5C668FE22B7B3D2349B78AEA275791D269A73CA2EE38DD8E8C4
          7426BB3041E95AC26A4B4386BE1E7465692B6FF83B1CCF89F4C5898EAD0C5BF6
          A7977910FF0096D1773F51D41F61E95956978745D662BD326EB6BB6582EDB000
          6246629FFE04320FB86AEE9943A95600AB0C107B8AE0E7D39637BAD1E73FB956
          F2949FF9E5291B0FBEC936FF00DF4D58D48F2CB991DF84AAAAD374E7D3F2FF00
          80ED6F9763BDA2B1BC29A8C9A8E8509B8C8BAB726DE704E4874E0E7DC8C1FC6B
          66BA13BAB9E5D483849C1F431F5E9941B481CE23690CB27FB8837115CE683036
          A1E35F325048D32D03364F49E6CBB1FC9987E15ADE22264BD962CF06CFCB0719
          C191C27F26A8BC14BE6CFAFDE36774BA948809CFDD5031FCCD63BD43BFE0C2E9
          D7FCFF00CB43AAAC0F176AB2699A7279018CF336C403A1278C7EB5BF5C4EA11E
          AB7DE268C5BF932DA69D2091DEE785078CFE5D7F006AAAB6A365D4C70508CAA7
          34ED68EBAFE1F8D8C7D6565B7486D5EC647B882348E6F2892AEC4E49047273BB
          1EC7A541E0EBA4D2FC488F36993C46E635B60C0311B99FA9CF63B7FF001D3EF5
          1EB9AAB4F724CB7FB6462BB8A29FE981C62B05AE4C12C33C3A93AC91B2481821
          3B1B713D0F5C649F7C9F7AE152B54BA3EA7D839E15C67BBFF11DBC97D6DE5C5A
          A4F6E16586E6565DCAC45C61C0233D1557E5C673F301E9CDCFF8498A1B0DE614
          174AD2050FB999CE4024F61BB803B6DC76A9AF8C563A436A36B2477BA64CE659
          600032EE604395719C0249C803839F5C56068DE19927D22DF58D45B684502CE0
          E46D0642C1DCF71F3138006456ED4D3B23CA8BC3CE1CD35D6CBF1D3CACEDFA3E
          8534026F16FDA9196341248AAEF22EC5DCAC14FE0483EF83D306BA55F188437F
          A8AF952DBC2553CA2DB5F693F29E9CF7FCEB9CB99EC6C92478E3B35957CCD981
          965665F50BEA5860F03031D3267B8D052E7424D774FC3DA5C48B3DD5A31C8015
          9B76180CEDEB918CFE58ACE2E493E567556A74A528FB68EF64BFCBD5F465B8A6
          1769A3DCC169247E76A0ADE7EDF29A3660328BFDE42B8C11FDDE69BE22D42E6F
          6E0F9368AE095E25C7383B79E71C9FE5F5AD8D0D6EAFF4A1ACEA53BC63F78F65
          6CC8156DC1C85208FBDC7033D8F4EF5C46A735A9BC2A6FA41CA83B633C7524F5
          EC69D5BC63EA183E5AB55BB6B1F57D7FAFEB576F42B5BBBFB5BCD305AC31BCF1
          A491CBC6414DD8C0F56F9867DBDEBADF871712CFE1FB8F3D00956EDF73739724
          2B64FBF38FC05701A55EC1A76AF657497D2C78923F31829002E7E6079E4003F1
          CFB57496FA15C5BF8CB489350BD6BA86F19EE2292D8EC1E6280D9231D08C74F5
          F4A745EA9AF4166304D4E1276BEAB47BA5AFE0975F91E935CE789ACD64BCB372
          76A5CAB59C8C3FDB1F2FE4DCFE15D1D6378A548D15E65FBF03A48A7D083FFD7A
          EAA8AF167CFE124D568DBAE9F7E864F856E5975FD42175082FA08AF950766236
          C9FF008F575F5C45A15B5F1AE9E57199FED96C79E701CCA33E9C3576F453D8AC
          625ED2EBAAFCB4FD0E675727FB664C7A5B7FE8F4AAFE0190C7E1DBD958336DBC
          95881D4F4F5A9FC407CAD4E5979016CC4BC7731C81FF0092D45E125610F882C4
          1C491DFCDB7A70180C7504763EB59AFE21D5357C2AF97F91D1E9F7D16A566975
          067CB7CE338CF048EC4FA5715AB6AAF1F88A5D3D7CF69E789E210AF0259083B3
          70F4C639E31C1E99AEAF428E482D668262A648A621806DD8C80C3276AE783D80
          F4ED55757F09689AA48F757F6BFBECEE69964656E001D8FA015728B94518D0AB
          4E8D59732D3A7E8709796B3585D5BC3A8E911ACF315DA1CA3071B48201DD8CEE
          E7AE7A7E39F25EDA10B11B2B40E111D8911A8236E5B9E9939E9D47B5759A8DB6
          9F6535A9D221318C32C9BB2772F04125B39E991F4AC0FED2D196EE04B9D2E2B8
          B64B016EE91052D9E19A407B1E4FA1E7AD7134A2ED73E869D4955873285F4F4E
          FD2FFA9A11DCB5FF008374BD0F4D96192EEE33E74317CC235DC5B7311C28E412
          31DFDAB7B52D46D2DB4F86CADE68C436CAB1A9721B76DDA3A67D01EBD79F6351
          C36F65A3E9A6E3462A34EBA886031255F82083DC1E87D7861E98E4B53BABEB9D
          5059C4976F7249DB1C71804929F3707040C01D47635AC9B5A2D5B3829C2151DE
          5EEC62DBD7BBDEFE9B797E5195B7C24925D5AF98CC032FD955C0019464F3CF09
          9E9CEE61DCD6F784757B23653F876E2E7026056DE5202A9DCA015C7639C9F724
          F73CF376FA16B134B3AAD8DF33A7EEA6C04E3853B7AFA11FA53952F269FCC81E
          69307CD71330507E5264CEDC9008538F6FC339439E0D5D1E857742BD395A57B6
          BD347D3A7E7D0EA34FBF3A3F87AF34BD5A558AE6D9CF9514AB80D193C1538F98
          649C7D2B9F4D4ADEE3534B5821D3E66918112189147DD2B8F9901CEEE6BB9BA8
          05D5A38D76533DAC7086B88CAA84129C10A8400C31F5EE39EB58ADABDADAEB28
          A96696F1CF6C9146AE3036A9255871CF3C0F7C735ACE36B26F438B0F539D4E51
          85E4EEDEBA74DB67E7FA983A631D5AE0C51C5A5C66211B1371E5C7BC6D2381B3
          279C13F414EB5D4A6B8F1B58E99A7901834314CC936372C5B4B9041E41087815
          67409F4F8D6F27D76D1AF61944410F96251046A0804E4E507CC31FA57A069DA3
          68F6A914FA758DA2646F8E58E319C11D4375E41FCA9D282959DCCF1D88952738
          F2E8F45DBA5CD17608B96381903F3E2B9FD5AF65B9F0C5F4B3471A60855F2E40
          E186579CFD73F956EDCB88EDA47620055272481D3DCF15CD6A3120F0CC91C6E6
          46BEB80A1CBABEF39C039500721474ADEA3D1FA1E5E122B9E2DF7466316FF84D
          F46FEFFDAAE7767FEBDA3CFF005AEF2B86B22B77E37D3D547FA817975903B348
          621FA2FEB5DCD3A7B3618C7EF463D95BF1661788A14F3EC26946623235BCBFEE
          C8BB79F6AC6F0ECCF67E2D9239C80DA95A231EDFBE8B28EBFA31AEAB56B11A96
          97716BDE45F97FDE1C8FD6B86BD9A56820D4E01FE956CFF6B0BD32CB85B84F6C
          E15FE8CD59CFDD9DCEBC2AF6D45D3F97EABF1DFC91D559992CF5492D23F257CC
          7F33CA5C616319190AA06DEABCB1E7071D2AD6AFA4B6AD1A446F27B787A48916
          3F78320E33DBA75AA57D22CD0DB6B9605E5511EED88198C83A80147F164E327A
          026B66DAE23BBB68E785834722EE04568927EEB38E72945AAB1D1FEA713E24F0
          EC3A744F751484069228E0DCCDFE8C801DC33939C9E7A773D6B1BC2DE1CFED2D
          19353B3611CF119E19D5C3B0B95603818618C02476E4735E9B79636DA84061BC
          8239E33CED91723EB5CF692BA8F8734CB8B7B8D3ED05ADAC6CC93C0C13CCDA38
          2CBEA40E4FAD66E9C54AF6D0EB8632AD4A2A0A5EF27D5EEB6FEBCF5DCC2D26CD
          1677892EA796DE0569ED6C5D331B3950C50924F2549F970700920920D49E1DFE
          CFB09E7D66641E7C9218628A14FBEE7AED18E074C631F78E73C56E34AB6490DD
          D8D9497563395937DA282EA01DCA36F19E491F4EBD2B96B985FCB11D85B5DA5F
          D9CC6EA211A6EFDDB1CE403C3E3E50707AFA8ACECE2FDD3A949574D557A3B76F
          3BDFE76BF5D6E749A4477573E2AB9BB4922B58153FD22CD27323339FBACCBF75
          4E076E78F7AC2D574C48FC676F6F66104C194A997710320B16C0E381CE0900ED
          EE4D5AB1B29B4F9ADE6377ACDDDE5FB198C76E8B0C684E326453900F347DA61B
          8D62F6FBC8B9BD592D9ADE1022C99B079381FC2C3E5DC07AE7A8CB7AA49F7263
          7529383D1C6DFA75F9EE36FE2B5D42E6D2CACEE66BC819B634324AC893C982C5
          8B85239E588C838E467A54DE28F0F59D841717E645532CB088DA4EB0045C70DC
          939C0ED5A33CD069570B7F2DAA7F6ADD930DB4270657DCD9F988EC3007B05EC4
          E2AC4ADADDF5E456371610416A0869AF1245915C01F75519720938EA0E066AB9
          534D753155AA42519A7EEAEED6BD5DBBEBD96A723E16F0B69BE24D1A4667502D
          E59A15921209937052ACC700E549E01E3F0AEE7C39A6DEE93A4A59DFDDA5D345
          8489923D81630A001EE78273EF5A30DBC36E8520892252724228519FC2A4ADE3
          051D8F3AAE22756FCCF43375C9916CD606284CEDB0236DCB7D03119E71C673E9
          59BAECDE4CF671901FECA8D7522C6B80CCA3E5C0E7AB718F7AB6AB0EA9A8ADE8
          9E3686CD9800A59594E30770270475EC3A7535CE6A5A9284BAD4E603603E7856
          FF009E719C463DB74BB7F046ACA6FF0013B30F0B34BB6FEAF4B7DDF8967C216A
          EDE20D4E7721D2C628B4F4900EACA3327FE3DCFE35D9D6278434D934CF0EDBA5
          CE7ED539371393D4BBF273EE0607E15B75AC1591C55E7CF51B0AE4B57B46D3B5
          60D1ED582F9C3C65F954B81C60FF00B2E0953F53E95D6D55D474F8754B196D2E
          0663906323AA9EC4529C79968561AB7B29EBB3DFFAF2FF008072BE1BBC8B4EBB
          6D1EE07FC4BEF0B35A0979D8D9C3C2D9EE0E78FF00115A2897DA35E4D18B9792
          DE79A36579C1611824295181CB31EC0614739F5C0B882495AE34FD4FCC179180
          ECE8093205E16E23EE580E1875207A8AD9D37511AA47FD91ACB04BF09BA1B889
          B02752081246DEB827F5F703084BA7DDFE47A95E96F516A9FC5D7FEDE5FAFDEF
          769753907A1A474596368E450C8C0865619041ED5CF2DC49A2EA0ED756CA2D9D
          4EFB9560151141DA02F6503031D49638ED9D9B2BE8EFA3678924508DB4EF5C73
          EDEB5BA927A1E4CE8CA1EF2D5772858F85B4BD326F36CA29A121B7055B9976E7
          FDDDD823EA2AADEDDEB5A4334367A67F68407FD43AB85283FBAC3DBF977AE8A8
          A1C55B4D071AEF9AF35CDEB7FF003B9E6D6EDE30D33585BDFEC25955D4A14578
          F2C09072594E7391D5B3DEBAFB3B1BDD52C653AFA088CE36FD92095808D73D0B
          29E49E33CE38C7AE76A8A51A6A3A175B152AAEED24FC8C7D2BC29A3E8B71F68B
          1B3093E08123BB3900FA649C7E15B1450480324E00AB492D11CF29CA6EF27761
          59F7F34B30FB35A33A33305799630E23F620FF0081C6466A1BDD58C928B4D31A
          296E9C06FBDF71776D2D8EE0771906AB33268BBE3B7DD3EA578431467DC1703B
          9C0F9473C9E4F7A89491D14E8C959BDFA2FD5F9106A52456364BA543208C6D32
          5D4899C469D5B00938C93C2FB81DEB12D6D5B5EF10C762D1016B64CB717AA0E4
          2B00443067BED1C9ED92F4CBDBD955E2B7B2C5D6A176DBADFF00E9ABFF00CF66
          CFFCB34E76E7A91BBB0AEC7C3FA245A0E9696B1B996562649A66EB2C87AB1FF3
          D00A88AE6773AAB4D51872ADDFF4DFF5F9A669D14515B9E58514514019BAD68D
          16AF027CED05D4277C1709F7A36FF0F515C6CB11967FECFD4E0F26F51F7AC68C
          17CC27FE5A40DD013D4A1E0F6C1AF44AA5AA69367AC5A9B7BD8448BD55BA321F
          507B1ACAA53E6D51DF85C63A5EECB6E9DD7A7F97DD639CB4D7DA183ECDAE0FB4
          D996D8B7A8A4608E8245EA8C3F3CFE75A4BA5C9F68B7BAD16F952DB6ED641875
          60371CE7AB12CDC924719E73CD62DEE97AAE90FBDD65D4AD80D82E6003ED289F
          DD753C4ABEC73F8555D3E68D9CCBA3DD18E4CE5C5982C33DF7DBB7CC3AFF000E
          E1592935A4BFE09DB2A50A89CE93B7E31F9AE8FE5E8AC7509ADCD6760B36AF6C
          F148A3F78635F9549C91D4E3A63A13C9C56847A9D9C923A2CEBB91FCB3B811F3
          671819EBC9038F5AC0B6F115E31F2A7B6B7BE23EF0B6930E3EB1B61B3F852CB7
          DA149216BDB29ED1D9D5CF99134677062C0FCBEF93EE6B4553CFEF39278577D6
          1AFF00775FC373A26BCB6440ED7112A1E0317183C67F954326A76D1CD2465F71
          8D37314F988E718C0C9CF07B56225DF865207896E488DD3CB20993A6CD9FFA08
          03352C1A86850DDCB736514935C4DBB7B451B316DD82473DB81C7D7D4D3E7F34
          67F566BEC4BEEB176E35B8D2EA08A1CB891CC64ED246EEC323A763D3A1CF6350
          DD5BEA93CACF3CB02DB468C1A2276ACDCF7EB80549F704679155E7D75AD00482
          CE1B20D801AEDC464E0607C9F78F000E33593A9EA216312EAD760263205C6618
          FF0008C7EF1FF21F5A97346D4E8356764BF17FF0FF0033525D5ADED229534ADA
          76E04F7B29F94100004B7F13600FFEBD605E5EB25C7D920824BCD42E4002D9BF
          D64B9C7CD37FCF38FA1D9C1231BB029F676FAB6BC633A646D676CBF7750BA882
          9507FE7842385FF78F241FBD5D768BE1FB1D0A175B54669A53BA6B894EE9253E
          ACD428B96E39D6A7455A1ABFEB77FD7C9AB957C39E1DFEC9335EDECDF6AD56EB
          FD7CE7A01D9147651C7E5F403768A2B64ADA1E6CA4E6EEC28A28A64851451400
          514514005656A9E1AD2B586F32EED17CE1C89A33B1C1EDC8EBF8D6AD149A4F46
          5427283BC5D99C95D784750002DAEB02E6241F2C3A9C0B3F3FEF91903E82AA1D
          27C476B909656AEB8C01657F3C207E0CD8EDE95DC5150E9C4E98E32AA567FE5F
          958E187FC2463FE65EBCE9FF004178E83A7F89AEC8C69F1423AE2F3539A41F4C
          21C71F4AEE68A3D9A0FADC96C92FBFFCCE3AD7C23AB37FAFD560B046FBF1E996
          C1188FFAE87E6CFE75ADA6784748D326FB425B9B8BBEA6E6E9BCC909F5C9E01F
          A015B74552824653AF527BB0A28A2A8C428A28A0028A28A00FFFD9}
        Stretch = True
      end
      object QRLabel7: TQRLabel
        Left = 112
        Top = 48
        Width = 147
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.4375
          296.333333333333
          127
          388.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3648#3592#3657#3634#3588#3640#3603#3607#3627#3634#3619#3621#3634#3604#3585#3619#3632#3610#3633#3591
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Cordia New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel6: TQRLabel
        Left = 112
        Top = 24
        Width = 195
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.0208333333333
          296.333333333333
          63.5
          515.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3626#3606#3634#3610#3633#3609#3648#3607#3588#3650#3609#3650#3621#3618#3637#3614#3619#3632#3592#3629#3617#3648#3585#3621#3657#3634
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Cordia New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
    end
    object TitleBand1: TQRBand
      Left = 38
      Top = 145
      Width = 718
      Height = 80
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        211.666666666667
        1899.70833333333)
      BandType = rbTitle
      object QRLabel12: TQRLabel
        Left = 152
        Top = 40
        Width = 409
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.9583333333333
          402.166666666667
          105.833333333333
          1082.14583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3585#3634#3619#3648#3588#3621#3639#3656#3629#3609#3607#3637#3656#3586#3629#3591#3619#3606#3650#3604#3618#3651#3594#3657#3648#3588#3619#3639#3656#3629#3591#3619#3633#3610#3626#3633#3597#3597#3634#3603#3592#3637#3614#3637#3648#3629#3626
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Cordia New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 20
      end
      object QRLabel11: TQRLabel
        Left = 152
        Top = 8
        Width = 419
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.6041666666667
          402.166666666667
          21.1666666666667
          1108.60416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3619#3634#3618#3591#3634#3609#3626#3634#3608#3636#3605#3585#3634#3619#3648#3585#3655#3610#3586#3657#3629#3617#3641#3621#3650#3604#3618#3594#3640#3604#3629#3640#3611#3585#3619#3603#3660#3648#3585#3655#3610#3586#3657#3629#3617#3641#3621
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'CordiaUPC'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 20
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 225
      Width = 718
      Height = 232
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        613.833333333333
        1899.70833333333)
      BandType = rbDetail
      object QRLabel5: TQRLabel
        Left = 24
        Top = 76
        Width = 21
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          63.5
          201.083333333333
          55.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3648#3623#3621#3634
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 24
        Top = 60
        Width = 22
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          63.5
          158.75
          58.2083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3623#3633#3609#3607#3637#3656
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 24
        Top = 44
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          63.5
          116.416666666667
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3648#3626#3657#3609#3607#3634#3591
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 24
        Top = 28
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          63.5
          74.0833333333333
          267.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3627#3617#3634#3618#3648#3621#3586#3607#3632#3648#3610#3637#3618#3609#3619#3606'   '
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 24
        Top = 12
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          63.5
          31.75
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3614#3609#3633#3585#3591#3634#3609#3586#3633#3610#3619#3606'   '
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 32
        Top = 111
        Width = 384
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          84.6666666666667
          293.6875
          1016)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          #3588#3623#3634#3617#3612#3636#3604#3611#3585#3605#3636'                                                     ' +
          '                                                       '
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 584
        Top = 111
        Width = 123
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1545.16666666667
          293.6875
          325.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3648#3623#3621#3634'                                  '
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 152
        Top = 8
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          402.166666666667
          21.1666666666667
          203.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3609#3634#3618' '#3648#3629#3609#3585' '#3591#3634#3617#3586#3635
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 152
        Top = 24
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          402.166666666667
          63.5
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3621#3585' 2545'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 152
        Top = 56
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          402.166666666667
          148.166666666667
          216.958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '19 '#3617#3637#3609#3634#3588#3617' 2545'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 152
        Top = 72
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          402.166666666667
          190.5
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '8 .30 '#3609'.'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 152
        Top = 40
        Width = 99
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          402.166666666667
          105.833333333333
          261.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3588#3603#3632#3623#3636#3624#3623#3585#3619#3619#3617#3624#3634#3626#3605#3619#3660
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 32
        Top = 176
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          84.6666666666667
          465.666666666667
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3629#3629#3585#3605#3633#3623#3585#3619#3632#3594#3634#3585
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 32
        Top = 160
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          84.6666666666667
          423.333333333333
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3629#3629#3585#3605#3633#3623#3585#3619#3632#3594#3634#3585
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 32
        Top = 144
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          84.6666666666667
          381
          190.5)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3648#3610#3619#3588#3585#3619#3632#3607#3633#3609#3627#3633#3609
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 32
        Top = 192
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          84.6666666666667
          508
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3592#3629#3604#3609#3634#3609#3612#3636#3604#3611#3585#3605#3636
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel21: TQRLabel
        Left = 32
        Top = 128
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          84.6666666666667
          338.666666666667
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #3592#3629#3604#3609#3634#3609#3612#3636#3604#3611#3585#3605#3636
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 584
        Top = 128
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1545.16666666667
          338.666666666667
          100.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '9.00 '#3609'.'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 584
        Top = 160
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1545.16666666667
          423.333333333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '13.26 '#3609'.'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel24: TQRLabel
        Left = 584
        Top = 192
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1545.16666666667
          508
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '16.45 '#3609'.'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 584
        Top = 176
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1545.16666666667
          465.666666666667
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '14.56 '#3609'.'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel26: TQRLabel
        Left = 584
        Top = 144
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1545.16666666667
          381
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '12.58 '#3609'.'
        Color = clWhite
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'local database'
    SQL.Strings = (
      'select "road_name" from road')
    Left = 32
  end
  object Query2: TQuery
    Active = True
    DatabaseName = 'local database'
    SQL.Strings = (
      'select * from report where "r_id"= :track_id')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'track_id'
        ParamType = ptInput
        Value = 0
      end>
  end
end
