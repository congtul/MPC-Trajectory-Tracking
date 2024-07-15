// Auto-generated. Do not edit!

// (in-package ugv_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class toUGV {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode = null;
      this.start_mode = null;
      this.send_parameters = null;
      this.Kp_steering = null;
      this.Ki_steering = null;
      this.Kd_steering = null;
      this.Kp_speed = null;
      this.Ki_speed = null;
      this.Kd_speed = null;
      this.set_speed = null;
      this.set_angle = null;
      this.mpc_L_wheel = null;
      this.mpc_Np = null;
      this.mpc_Nc = null;
      this.mpc_Q = null;
      this.mpc_Qp = null;
      this.mpc_R = null;
      this.mpc_umax = null;
      this.mpc_umin = null;
      this.refpoint_offset = null;
      this.lqr_L_wheel = null;
      this.lqr_Np = null;
      this.lqr_Q = null;
      this.lqr_K = null;
      this.lqr_R = null;
      this.lqr_umax = null;
      this.lqr_umin = null;
      this.TrajectoryType = null;
      this.numWaypoint = null;
      this.lat_base = null;
      this.lng_base = null;
      this.X_point = null;
      this.Y_point = null;
    }
    else {
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('start_mode')) {
        this.start_mode = initObj.start_mode
      }
      else {
        this.start_mode = 0;
      }
      if (initObj.hasOwnProperty('send_parameters')) {
        this.send_parameters = initObj.send_parameters
      }
      else {
        this.send_parameters = 0;
      }
      if (initObj.hasOwnProperty('Kp_steering')) {
        this.Kp_steering = initObj.Kp_steering
      }
      else {
        this.Kp_steering = 0.0;
      }
      if (initObj.hasOwnProperty('Ki_steering')) {
        this.Ki_steering = initObj.Ki_steering
      }
      else {
        this.Ki_steering = 0.0;
      }
      if (initObj.hasOwnProperty('Kd_steering')) {
        this.Kd_steering = initObj.Kd_steering
      }
      else {
        this.Kd_steering = 0.0;
      }
      if (initObj.hasOwnProperty('Kp_speed')) {
        this.Kp_speed = initObj.Kp_speed
      }
      else {
        this.Kp_speed = 0.0;
      }
      if (initObj.hasOwnProperty('Ki_speed')) {
        this.Ki_speed = initObj.Ki_speed
      }
      else {
        this.Ki_speed = 0.0;
      }
      if (initObj.hasOwnProperty('Kd_speed')) {
        this.Kd_speed = initObj.Kd_speed
      }
      else {
        this.Kd_speed = 0.0;
      }
      if (initObj.hasOwnProperty('set_speed')) {
        this.set_speed = initObj.set_speed
      }
      else {
        this.set_speed = 0.0;
      }
      if (initObj.hasOwnProperty('set_angle')) {
        this.set_angle = initObj.set_angle
      }
      else {
        this.set_angle = 0.0;
      }
      if (initObj.hasOwnProperty('mpc_L_wheel')) {
        this.mpc_L_wheel = initObj.mpc_L_wheel
      }
      else {
        this.mpc_L_wheel = 0.0;
      }
      if (initObj.hasOwnProperty('mpc_Np')) {
        this.mpc_Np = initObj.mpc_Np
      }
      else {
        this.mpc_Np = 0;
      }
      if (initObj.hasOwnProperty('mpc_Nc')) {
        this.mpc_Nc = initObj.mpc_Nc
      }
      else {
        this.mpc_Nc = 0;
      }
      if (initObj.hasOwnProperty('mpc_Q')) {
        this.mpc_Q = initObj.mpc_Q
      }
      else {
        this.mpc_Q = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('mpc_Qp')) {
        this.mpc_Qp = initObj.mpc_Qp
      }
      else {
        this.mpc_Qp = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('mpc_R')) {
        this.mpc_R = initObj.mpc_R
      }
      else {
        this.mpc_R = 0.0;
      }
      if (initObj.hasOwnProperty('mpc_umax')) {
        this.mpc_umax = initObj.mpc_umax
      }
      else {
        this.mpc_umax = 0.0;
      }
      if (initObj.hasOwnProperty('mpc_umin')) {
        this.mpc_umin = initObj.mpc_umin
      }
      else {
        this.mpc_umin = 0.0;
      }
      if (initObj.hasOwnProperty('refpoint_offset')) {
        this.refpoint_offset = initObj.refpoint_offset
      }
      else {
        this.refpoint_offset = 0;
      }
      if (initObj.hasOwnProperty('lqr_L_wheel')) {
        this.lqr_L_wheel = initObj.lqr_L_wheel
      }
      else {
        this.lqr_L_wheel = 0.0;
      }
      if (initObj.hasOwnProperty('lqr_Np')) {
        this.lqr_Np = initObj.lqr_Np
      }
      else {
        this.lqr_Np = 0;
      }
      if (initObj.hasOwnProperty('lqr_Q')) {
        this.lqr_Q = initObj.lqr_Q
      }
      else {
        this.lqr_Q = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('lqr_K')) {
        this.lqr_K = initObj.lqr_K
      }
      else {
        this.lqr_K = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('lqr_R')) {
        this.lqr_R = initObj.lqr_R
      }
      else {
        this.lqr_R = 0.0;
      }
      if (initObj.hasOwnProperty('lqr_umax')) {
        this.lqr_umax = initObj.lqr_umax
      }
      else {
        this.lqr_umax = 0.0;
      }
      if (initObj.hasOwnProperty('lqr_umin')) {
        this.lqr_umin = initObj.lqr_umin
      }
      else {
        this.lqr_umin = 0.0;
      }
      if (initObj.hasOwnProperty('TrajectoryType')) {
        this.TrajectoryType = initObj.TrajectoryType
      }
      else {
        this.TrajectoryType = 0;
      }
      if (initObj.hasOwnProperty('numWaypoint')) {
        this.numWaypoint = initObj.numWaypoint
      }
      else {
        this.numWaypoint = 0;
      }
      if (initObj.hasOwnProperty('lat_base')) {
        this.lat_base = initObj.lat_base
      }
      else {
        this.lat_base = 0.0;
      }
      if (initObj.hasOwnProperty('lng_base')) {
        this.lng_base = initObj.lng_base
      }
      else {
        this.lng_base = 0.0;
      }
      if (initObj.hasOwnProperty('X_point')) {
        this.X_point = initObj.X_point
      }
      else {
        this.X_point = new Array(40).fill(0);
      }
      if (initObj.hasOwnProperty('Y_point')) {
        this.Y_point = initObj.Y_point
      }
      else {
        this.Y_point = new Array(40).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type toUGV
    // Serialize message field [mode]
    bufferOffset = _serializer.uint8(obj.mode, buffer, bufferOffset);
    // Serialize message field [start_mode]
    bufferOffset = _serializer.uint8(obj.start_mode, buffer, bufferOffset);
    // Serialize message field [send_parameters]
    bufferOffset = _serializer.uint8(obj.send_parameters, buffer, bufferOffset);
    // Serialize message field [Kp_steering]
    bufferOffset = _serializer.float64(obj.Kp_steering, buffer, bufferOffset);
    // Serialize message field [Ki_steering]
    bufferOffset = _serializer.float64(obj.Ki_steering, buffer, bufferOffset);
    // Serialize message field [Kd_steering]
    bufferOffset = _serializer.float64(obj.Kd_steering, buffer, bufferOffset);
    // Serialize message field [Kp_speed]
    bufferOffset = _serializer.float64(obj.Kp_speed, buffer, bufferOffset);
    // Serialize message field [Ki_speed]
    bufferOffset = _serializer.float64(obj.Ki_speed, buffer, bufferOffset);
    // Serialize message field [Kd_speed]
    bufferOffset = _serializer.float64(obj.Kd_speed, buffer, bufferOffset);
    // Serialize message field [set_speed]
    bufferOffset = _serializer.float64(obj.set_speed, buffer, bufferOffset);
    // Serialize message field [set_angle]
    bufferOffset = _serializer.float64(obj.set_angle, buffer, bufferOffset);
    // Serialize message field [mpc_L_wheel]
    bufferOffset = _serializer.float64(obj.mpc_L_wheel, buffer, bufferOffset);
    // Serialize message field [mpc_Np]
    bufferOffset = _serializer.int8(obj.mpc_Np, buffer, bufferOffset);
    // Serialize message field [mpc_Nc]
    bufferOffset = _serializer.int8(obj.mpc_Nc, buffer, bufferOffset);
    // Check that the constant length array field [mpc_Q] has the right length
    if (obj.mpc_Q.length !== 3) {
      throw new Error('Unable to serialize array field mpc_Q - length must be 3')
    }
    // Serialize message field [mpc_Q]
    bufferOffset = _arraySerializer.float64(obj.mpc_Q, buffer, bufferOffset, 3);
    // Check that the constant length array field [mpc_Qp] has the right length
    if (obj.mpc_Qp.length !== 3) {
      throw new Error('Unable to serialize array field mpc_Qp - length must be 3')
    }
    // Serialize message field [mpc_Qp]
    bufferOffset = _arraySerializer.float64(obj.mpc_Qp, buffer, bufferOffset, 3);
    // Serialize message field [mpc_R]
    bufferOffset = _serializer.float64(obj.mpc_R, buffer, bufferOffset);
    // Serialize message field [mpc_umax]
    bufferOffset = _serializer.float64(obj.mpc_umax, buffer, bufferOffset);
    // Serialize message field [mpc_umin]
    bufferOffset = _serializer.float64(obj.mpc_umin, buffer, bufferOffset);
    // Serialize message field [refpoint_offset]
    bufferOffset = _serializer.int8(obj.refpoint_offset, buffer, bufferOffset);
    // Serialize message field [lqr_L_wheel]
    bufferOffset = _serializer.float64(obj.lqr_L_wheel, buffer, bufferOffset);
    // Serialize message field [lqr_Np]
    bufferOffset = _serializer.int8(obj.lqr_Np, buffer, bufferOffset);
    // Check that the constant length array field [lqr_Q] has the right length
    if (obj.lqr_Q.length !== 3) {
      throw new Error('Unable to serialize array field lqr_Q - length must be 3')
    }
    // Serialize message field [lqr_Q]
    bufferOffset = _arraySerializer.float64(obj.lqr_Q, buffer, bufferOffset, 3);
    // Check that the constant length array field [lqr_K] has the right length
    if (obj.lqr_K.length !== 3) {
      throw new Error('Unable to serialize array field lqr_K - length must be 3')
    }
    // Serialize message field [lqr_K]
    bufferOffset = _arraySerializer.float64(obj.lqr_K, buffer, bufferOffset, 3);
    // Serialize message field [lqr_R]
    bufferOffset = _serializer.float64(obj.lqr_R, buffer, bufferOffset);
    // Serialize message field [lqr_umax]
    bufferOffset = _serializer.float64(obj.lqr_umax, buffer, bufferOffset);
    // Serialize message field [lqr_umin]
    bufferOffset = _serializer.float64(obj.lqr_umin, buffer, bufferOffset);
    // Serialize message field [TrajectoryType]
    bufferOffset = _serializer.int8(obj.TrajectoryType, buffer, bufferOffset);
    // Serialize message field [numWaypoint]
    bufferOffset = _serializer.int8(obj.numWaypoint, buffer, bufferOffset);
    // Serialize message field [lat_base]
    bufferOffset = _serializer.float64(obj.lat_base, buffer, bufferOffset);
    // Serialize message field [lng_base]
    bufferOffset = _serializer.float64(obj.lng_base, buffer, bufferOffset);
    // Check that the constant length array field [X_point] has the right length
    if (obj.X_point.length !== 40) {
      throw new Error('Unable to serialize array field X_point - length must be 40')
    }
    // Serialize message field [X_point]
    bufferOffset = _arraySerializer.float64(obj.X_point, buffer, bufferOffset, 40);
    // Check that the constant length array field [Y_point] has the right length
    if (obj.Y_point.length !== 40) {
      throw new Error('Unable to serialize array field Y_point - length must be 40')
    }
    // Serialize message field [Y_point]
    bufferOffset = _arraySerializer.float64(obj.Y_point, buffer, bufferOffset, 40);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type toUGV
    let len;
    let data = new toUGV(null);
    // Deserialize message field [mode]
    data.mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [start_mode]
    data.start_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [send_parameters]
    data.send_parameters = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Kp_steering]
    data.Kp_steering = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Ki_steering]
    data.Ki_steering = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Kd_steering]
    data.Kd_steering = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Kp_speed]
    data.Kp_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Ki_speed]
    data.Ki_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Kd_speed]
    data.Kd_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [set_speed]
    data.set_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [set_angle]
    data.set_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mpc_L_wheel]
    data.mpc_L_wheel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mpc_Np]
    data.mpc_Np = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [mpc_Nc]
    data.mpc_Nc = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [mpc_Q]
    data.mpc_Q = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [mpc_Qp]
    data.mpc_Qp = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [mpc_R]
    data.mpc_R = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mpc_umax]
    data.mpc_umax = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mpc_umin]
    data.mpc_umin = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [refpoint_offset]
    data.refpoint_offset = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [lqr_L_wheel]
    data.lqr_L_wheel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lqr_Np]
    data.lqr_Np = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [lqr_Q]
    data.lqr_Q = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [lqr_K]
    data.lqr_K = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [lqr_R]
    data.lqr_R = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lqr_umax]
    data.lqr_umax = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lqr_umin]
    data.lqr_umin = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [TrajectoryType]
    data.TrajectoryType = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [numWaypoint]
    data.numWaypoint = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [lat_base]
    data.lat_base = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lng_base]
    data.lng_base = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [X_point]
    data.X_point = _arrayDeserializer.float64(buffer, bufferOffset, 40)
    // Deserialize message field [Y_point]
    data.Y_point = _arrayDeserializer.float64(buffer, bufferOffset, 40)
    return data;
  }

  static getMessageSize(object) {
    return 889;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ugv_msgs/toUGV';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1efb4b5a89c87d8d3553438208941e46';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #0: update PID, 1: manual, 2: MPC, 3: LQR
    uint8 mode
    uint8 start_mode
    uint8 send_parameters
    
    #Parameters for PID
    float64 Kp_steering
    float64 Ki_steering 
    float64 Kd_steering
    float64 Kp_speed
    float64 Ki_speed 
    float64 Kd_speed
    
    # Parameters for manual
    float64 set_speed
    float64 set_angle
    
    # Parameters for MPC
    float64 mpc_L_wheel
    int8 mpc_Np
    int8 mpc_Nc
    float64[3] mpc_Q
    float64[3] mpc_Qp
    float64 mpc_R
    float64 mpc_umax
    float64 mpc_umin
    int8 refpoint_offset
    
    #Parameters for LQR
    float64 lqr_L_wheel
    int8 lqr_Np
    float64[3] lqr_Q
    float64[3] lqr_K
    float64 lqr_R
    float64 lqr_umax
    float64 lqr_umin
    
    int8 TrajectoryType #Line = 0
    
    int8 numWaypoint   # number of waypoint except for base waypoint
    float64 lat_base
    float64 lng_base
    float64[40] X_point
    float64[40] Y_point
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new toUGV(null);
    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.start_mode !== undefined) {
      resolved.start_mode = msg.start_mode;
    }
    else {
      resolved.start_mode = 0
    }

    if (msg.send_parameters !== undefined) {
      resolved.send_parameters = msg.send_parameters;
    }
    else {
      resolved.send_parameters = 0
    }

    if (msg.Kp_steering !== undefined) {
      resolved.Kp_steering = msg.Kp_steering;
    }
    else {
      resolved.Kp_steering = 0.0
    }

    if (msg.Ki_steering !== undefined) {
      resolved.Ki_steering = msg.Ki_steering;
    }
    else {
      resolved.Ki_steering = 0.0
    }

    if (msg.Kd_steering !== undefined) {
      resolved.Kd_steering = msg.Kd_steering;
    }
    else {
      resolved.Kd_steering = 0.0
    }

    if (msg.Kp_speed !== undefined) {
      resolved.Kp_speed = msg.Kp_speed;
    }
    else {
      resolved.Kp_speed = 0.0
    }

    if (msg.Ki_speed !== undefined) {
      resolved.Ki_speed = msg.Ki_speed;
    }
    else {
      resolved.Ki_speed = 0.0
    }

    if (msg.Kd_speed !== undefined) {
      resolved.Kd_speed = msg.Kd_speed;
    }
    else {
      resolved.Kd_speed = 0.0
    }

    if (msg.set_speed !== undefined) {
      resolved.set_speed = msg.set_speed;
    }
    else {
      resolved.set_speed = 0.0
    }

    if (msg.set_angle !== undefined) {
      resolved.set_angle = msg.set_angle;
    }
    else {
      resolved.set_angle = 0.0
    }

    if (msg.mpc_L_wheel !== undefined) {
      resolved.mpc_L_wheel = msg.mpc_L_wheel;
    }
    else {
      resolved.mpc_L_wheel = 0.0
    }

    if (msg.mpc_Np !== undefined) {
      resolved.mpc_Np = msg.mpc_Np;
    }
    else {
      resolved.mpc_Np = 0
    }

    if (msg.mpc_Nc !== undefined) {
      resolved.mpc_Nc = msg.mpc_Nc;
    }
    else {
      resolved.mpc_Nc = 0
    }

    if (msg.mpc_Q !== undefined) {
      resolved.mpc_Q = msg.mpc_Q;
    }
    else {
      resolved.mpc_Q = new Array(3).fill(0)
    }

    if (msg.mpc_Qp !== undefined) {
      resolved.mpc_Qp = msg.mpc_Qp;
    }
    else {
      resolved.mpc_Qp = new Array(3).fill(0)
    }

    if (msg.mpc_R !== undefined) {
      resolved.mpc_R = msg.mpc_R;
    }
    else {
      resolved.mpc_R = 0.0
    }

    if (msg.mpc_umax !== undefined) {
      resolved.mpc_umax = msg.mpc_umax;
    }
    else {
      resolved.mpc_umax = 0.0
    }

    if (msg.mpc_umin !== undefined) {
      resolved.mpc_umin = msg.mpc_umin;
    }
    else {
      resolved.mpc_umin = 0.0
    }

    if (msg.refpoint_offset !== undefined) {
      resolved.refpoint_offset = msg.refpoint_offset;
    }
    else {
      resolved.refpoint_offset = 0
    }

    if (msg.lqr_L_wheel !== undefined) {
      resolved.lqr_L_wheel = msg.lqr_L_wheel;
    }
    else {
      resolved.lqr_L_wheel = 0.0
    }

    if (msg.lqr_Np !== undefined) {
      resolved.lqr_Np = msg.lqr_Np;
    }
    else {
      resolved.lqr_Np = 0
    }

    if (msg.lqr_Q !== undefined) {
      resolved.lqr_Q = msg.lqr_Q;
    }
    else {
      resolved.lqr_Q = new Array(3).fill(0)
    }

    if (msg.lqr_K !== undefined) {
      resolved.lqr_K = msg.lqr_K;
    }
    else {
      resolved.lqr_K = new Array(3).fill(0)
    }

    if (msg.lqr_R !== undefined) {
      resolved.lqr_R = msg.lqr_R;
    }
    else {
      resolved.lqr_R = 0.0
    }

    if (msg.lqr_umax !== undefined) {
      resolved.lqr_umax = msg.lqr_umax;
    }
    else {
      resolved.lqr_umax = 0.0
    }

    if (msg.lqr_umin !== undefined) {
      resolved.lqr_umin = msg.lqr_umin;
    }
    else {
      resolved.lqr_umin = 0.0
    }

    if (msg.TrajectoryType !== undefined) {
      resolved.TrajectoryType = msg.TrajectoryType;
    }
    else {
      resolved.TrajectoryType = 0
    }

    if (msg.numWaypoint !== undefined) {
      resolved.numWaypoint = msg.numWaypoint;
    }
    else {
      resolved.numWaypoint = 0
    }

    if (msg.lat_base !== undefined) {
      resolved.lat_base = msg.lat_base;
    }
    else {
      resolved.lat_base = 0.0
    }

    if (msg.lng_base !== undefined) {
      resolved.lng_base = msg.lng_base;
    }
    else {
      resolved.lng_base = 0.0
    }

    if (msg.X_point !== undefined) {
      resolved.X_point = msg.X_point;
    }
    else {
      resolved.X_point = new Array(40).fill(0)
    }

    if (msg.Y_point !== undefined) {
      resolved.Y_point = msg.Y_point;
    }
    else {
      resolved.Y_point = new Array(40).fill(0)
    }

    return resolved;
    }
};

module.exports = toUGV;
