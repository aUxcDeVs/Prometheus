-- This Script is Part of the Prometheus Obfuscator by Levno_710
-- Modified with Toxic Names by Aux
-- ULTRA CHAOS EDITION with SUPER LONG FAKE OBFUSCATION 🔥
--
-- namegenerators/confuse.lua (Pure Toxic Edition)
--
-- This Script provides a function for generation of confusing variable names

local util = require("prometheus.util");
local chararray = util.chararray;

local varNames = {
    -- ORIGINAL TOXIC NAMES
    "Luraphisbetter",
    "ilovePsU",
    "AuxHuB",
    "SkillIssue",
    "xD",
    "NiceTrykiddo",
    "HiGay",
    "MomsCalling",
    "GoOutside",
    "StillHere",
    "saiyan",
    "shizo",
    "forkwithprometheus",
    "ifyourhereurgay",
    "NahBrogetout",
    "plsdontskid",
    "UseMoonsecV3",
    
    -- EMOJI TOXIC NAMES 💀
    "SkillIssue💀",
    "NahBro😭",
    "LittleBro💀",
    "TouchGrass🌱",
    "GetRekt🔥",
    "Skull💀",
    "Fire🔥",
    "Dead☠️",
    "Bruh💀",
    "Cap🧢",
    "Ratio",
    "Based🗿",
    "Fr💯",
    "Bussin🔥",
    "Bozo🤡",
    
    -- SUPER LONG FAKE OBFUSCATED STRINGS (100+ chars each)
    "KSSJS_JSNSISEJN_ISNJEJEJKSOS_MKDNWKDN_SKMWKDN_PLMKOIUJ_NHBGYVFT_CRDZEXSW_AQPLMOKN_IJUHBYGV",
    "XKJDNE_MSJDIE_KSOPWE_NJDIEKD_MSKDIE_PLOKIJU_NHBGYVFT_CRDZEXSW_AQWZSXED_CRFVTGBY_HNUJMIKO",
    "PLMKOW_NSJDIE_QWERBN_ASDCVF_ZXCVBN_QWERTY_ASDFGH_ZXCVBN_MNBVCX_LKJHGF_DSAQWE_RTYUIO_PLKJHG",
    "ZXCVBN_QWERTY_ASDFGH_HJKLZX_CVBNMA_SDFGHJ_TYUIOP_GHJKLZ_XCVBNM_QAZWSX_EDCRFV_TGBYHN_UJMIKO",
    "TYUIOP_GHJKLZ_XCVBNM_QAZWSX_EDCRFV_TGBYHN_UJMIKO_LPMJNH_YGBVFT_CDEXSW_ZAQXCD_ERFVBG_THNMJU",
    "QAZWSX_EDCRFV_TGBYHN_UJMIKO_LPMJNH_YGBVFT_CDEXSW_ZAQXCD_ERFVBG_THNMJU_YIKOLO_PMNJBH_VGYCFT",
    "UJMIKO_LPMJNH_YGBVFT_CDEXSW_ZAQXCD_ERFVBG_THNMJU_YIKOLO_PMNJBH_VGYCFT_XDRZSE_AWQZSX_EDCRFT",
    "CDEXSW_ZAQXCD_ERFVBG_THNMJU_YIKOLO_PMNJBH_VGYCFT_XDRZSE_AWQZSX_EDCRFT_VGYBHU_NJMIKO_LPMKOI",
    "THNMJU_YIKOLO_PMNJBH_VGYCFT_XDRZSE_AWQZSX_EDCRFT_VGYBHU_NJMIKO_LPMKOI_NUHBGY_VTFCRD_XESZWA",
    "VGYCFT_XDRZSE_AWQZSX_EDCRFT_VGYBHU_NJMIKO_LPMKOI_NUHBGY_VTFCRD_XESZWA_QPLMOK_INJUHB_YGVTFC",
    
    -- INSANELY LONG FAKE BASE64 (150+ chars)
    "aGVsbG8_d29ybGQ_LMAO_dGhpcw_aXNf_ZmFrZQ_bm90_cmVhbA_YXQ_YWxs_anVzdA_dHJvbGw_aW5n_eW91_Z290_cHduZWQ_Z2l0_Z29vZA_bm9vYg_c2tpZA_ZGV0ZWN0ZWQ_cGFzdGU_ZnJvbQ_eXQ",
    "Y2hhdGdwdA_d3JvdGU_c3RhY2tvdmVy_Zmxvdw_Z2l0aHVi_Y2xvbmU_ZnJlZQ_b2JmdXNjYXRvcg_bHVyYXBo_Y2FudA_hZmZvcmQ_djNybWk_Z290X251a2Vk_aXJvbmJyZXc_cnVzdA_cHN1_ZGVhZA_bG1hbw",
    "dGhpcw_aXNf_c3VwZXI_bG9uZw_ZmFrZQ_b2JmdXNjYXRlZA_c3RyaW5n_dGhhdA_bG9va3M_bGlrZQ_cmVhbA_ZW5jcnlwdGlvbg_YnV0_aXRz_anVzdA_Z2FyYmFnZQ_bG1hbw_Z290_ZW0",
    "eW91_dGhpbms_dGhpcw_aXNf_c29tZQ_bWlsaXRhcnk_Z3JhZGU_ZW5jcnlwdGlvbg_YnV0_aXRz_anVzdA_cHJpbnQ_aGVsbG8_d29ybGQ_bG1hbw_za2lsbA_aXNzdWU_YnJv",
    "d2h5_YXJl_eW91_ZXZlbg_yZWFkaW5n_dGhpcw_Z28_dG91Y2g_Z3Jhc3M_bWFu_dGhpcw_aXNf_c28_bG9uZw_Zm9y_bm9_cmVhc29u_YXQ_YWxs_anVzdA_dHJvbGxpbmc",
    "dGhpcw_dmFyaWFibGU_bmFtZQ_aXNf_c28_cmlkaWN1bG91c2x5_bG9uZw_dGhhdA_bm9ib2R5_d2lsbA_ZXZlcg_dHJ5_dG8_ZGVvYmZ1c2NhdGU_aXQ_bG1hbw_Z2V0X3Jla3Q",
    "aWYgeW91_YXJl_dHJ5aW5n_dG8_ZGVvYmZ1c2NhdGU_dGhpcw_eW91_aGF2ZQ_d2F5_dG9v_bXVjaA_ZnJlZQ_dGltZQ_Z28_ZG8_c29tZXRoaW5n_cHJvZHVjdGl2ZQ",
    "c2VyaW91c2x5_dGhvdWdo_d2h5_YXJl_eW91_c3RpbGw_cmVhZGluZw_dGhpcw_aXRz_bGl0ZXJhbGx5_anVzdA_Z2FyYmFnZQ_cmFuZG9t_Y2hhcmFjdGVycw_bm90aGluZw",
    
    -- MEGA ULTRA LONG MIXED CHAOS (200+ chars)
    "KSSJS_JSNSISEJN_aGVsbG8_d29ybGQ_XKJDNE_MSJDIE_PLMKOW_NSJDIE_QWERBN_ZXCVBN_QWERTY_ASDFGH_dGhpcw_aXNf_ZmFrZQ_TYUIOP_GHJKLZ_XCVBNM_bm90_cmVhbA_QAZWSX_EDCRFV_TGBYHN_UJMIKO_LPMJNH_anVzdA_dHJvbGw",
    "PLOKIJU_NHBGYVFT_Y2hhdGdwdA_d3JvdGU_CRDZEXSW_AQWZSXED_c3RhY2tvdmVy_Zmxvdw_CRFVTGBY_HNUJMIKO_Z2l0aHVi_Y2xvbmU_MNBVCX_LKJHGF_DSAQWE_ZnJlZQ_b2JmdXNjYXRvcg_RTYUIO_PLKJHG_bHVyYXBo_Y2FudA",
    "HJKLZX_CVBNMA_djNybWk_Z290X251a2Vk_SDFGHJ_TYUIOP_aXJvbmJyZXc_cnVzdA_GHJKLZ_XCVBNM_cHN1_ZGVhZA_QAZWSX_EDCRFV_bG1hbw_TGBYHN_UJMIKO_dGhpcw_aXNf_c3VwZXI_bG9uZw_LPMJNH_YGBVFT",
    "CDEXSW_ZAQXCD_eW91_dGhpbms_dGhpcw_ERFVBG_THNMJU_aXNf_c29tZQ_bWlsaXRhcnk_YIKOLO_PMNJBH_Z3JhZGU_ZW5jcnlwdGlvbg_VGYCFT_XDRZSE_YnV0_aXRz_AWQZSX_EDCRFT_anVzdA_cHJpbnQ_VGYBHU_NJMIKO",
    "LPMKOI_NUHBGY_d2h5_YXJl_eW91_ZXZlbg_VTFCRD_XESZWA_yZWFkaW5n_dGhpcw_QPLMOK_INJUHB_Z28_dG91Y2g_Z3Jhc3M_YGVTFC_RDXESZ_bWFu_dGhpcw_aXNf_c28_bG9uZw_AWQQAZ_WSXEDC",
    "RFVTGB_YHNUJM_dGhpcw_dmFyaWFibGU_bmFtZQ_IKOOLP_MKINJB_aXNf_c28_cmlkaWN1bG91c2x5_HGYVTF_CRDZXE_bG9uZw_dGhhdA_bm9ib2R5_SWAQPL_OKIMJU_d2lsbA_ZXZlcg_dHJ5_dG8",
    "NHBYGV_TFCRDE_aWYgeW91_YXJl_dHJ5aW5n_XSWZAQ_PLMOKN_dG8_ZGVvYmZ1c2NhdGU_IJBHUY_GTVFRC_dGhpcw_eW91_aGF2ZQ_d2F5_dG9v_DEXZSW_AQWZSX_bXVjaA_ZnJlZQ_dGltZQ_Z28_ZG8",
    
    -- ABSOLUTELY INSANE LENGTH (250+ chars of pure chaos)
    "XKJDNE_MSJDIE_KSOPWE_NJDIEKD_MSKDIE_PLOKIJU_NHBGYVFT_CRDZEXSW_AQWZSXED_CRFVTGBY_HNUJMIKO_LPMJNH_YGBVFT_CDEXSW_ZAQXCD_ERFVBG_THNMJU_YIKOLO_PMNJBH_VGYCFT_XDRZSE_AWQZSX_EDCRFT_VGYBHU_NJMIKO_LPMKOI_NUHBGY_VTFCRD_XESZWA_QPLMOK_INJUHB_YGVTFC_RDXESZ",
    "aGVsbG8_d29ybGQ_LMAO_dGhpcw_aXNf_ZmFrZQ_bm90_cmVhbA_YXQ_YWxs_anVzdA_dHJvbGw_aW5n_eW91_Z290_cHduZWQ_Z2l0_Z29vZA_bm9vYg_c2tpZA_ZGV0ZWN0ZWQ_cGFzdGU_ZnJvbQ_eXQ_Y2hhdGdwdA_d3JvdGU_c3RhY2tvdmVy_Zmxvdw_Z2l0aHVi_Y2xvbmU_ZnJlZQ_b2JmdXNjYXRvcg_bHVyYXBo_Y2FudA_hZmZvcmQ",
    "PLMKOW_NSJDIE_QWERBN_ASDCVF_ZXCVBN_QWERTY_ASDFGH_ZXCVBN_MNBVCX_LKJHGF_DSAQWE_RTYUIO_PLKJHG_ZXCVBN_QWERTY_ASDFGH_HJKLZX_CVBNMA_SDFGHJ_TYUIOP_GHJKLZ_XCVBNM_QAZWSX_EDCRFV_TGBYHN_UJMIKO_LPMJNH_YGBVFT_CDEXSW_ZAQXCD_ERFVBG_THNMJU_YIKOLO_PMNJBH_VGYCFT",
    
    -- SHORT CHAOS (for variety)
    "L",
    "W",
    "ratio",
    "cope",
    "skill",
    "issue",
    "bruh",
    "lmao",
    "rekt",
    "noob",
    "skid",
    "yikes",
    "based",
    "sigma",
}

local function generateName(id, scope)
    local name = {};
    local d = id % #varNames
	id = (id - d) / #varNames
	table.insert(name, varNames[d + 1]);
	while id > 0 do
		local d = id % #varNames
		id = (id - d) / #varNames
		table.insert(name, varNames[d + 1]);
	end
	return table.concat(name, "_");
end

local function prepare(ast)
    util.shuffle(varNames);
end

return {
	generateName = generateName, 
	prepare = prepare
};
