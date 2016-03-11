//
//  SectionModel.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/2/20.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import Foundation


public class SectionModel
{
    private var _sectionName:String = ""
    private var _sectionDescription:String = ""
    /*
    行集合
    */
    public var rowsItem:[RowModel] = []
    /*
    分组名称
    */
    public var SectionName:String{
        get{
            return self._sectionName
        }
        set{
            self._sectionName = newValue
        }
    }
    /*
    分组描述
    */
    public var SectionDescription:String{
        get{
            return self._sectionDescription
        }
        set{
            self._sectionDescription = newValue
        }
    }
    /*
    当前分组行数
    */
    public func RowsCount() -> Int{
        return rowsItem.count
    }
    
}

public class RowModel
{
    private var _iconimge:String = ""
    private var _title:String = ""
    private var _description:String = ""
    
    /*
    行图标
    */
    public var IconImage:String{
        get{
            return self._iconimge
        }
        set{
            self._iconimge = newValue
        }
    }
    /*
    行标题
    */
    public var Title:String{
        get{
            return self._title
        }
        set{
            self._title = newValue
        }
    }
    /*
    行描述
    */
    public var Description:String{
        get{
            return self._description
        }
        set{
            self._description = newValue
        }
    }


}
